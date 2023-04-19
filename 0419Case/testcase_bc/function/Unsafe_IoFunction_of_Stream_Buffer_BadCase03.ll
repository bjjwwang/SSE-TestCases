; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/Unsafe_IoFunction_of_Stream_Buffer_BadCase03.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/Unsafe_IoFunction_of_Stream_Buffer_BadCase03.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [9 x i8] c"file.txt\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Unsafe_IoFunction_of_Stream_Buffer_case01_Bad_03() #0 !dbg !9 {
entry:
  %fp = alloca %struct.__sFILE*, align 8
  %buffer = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %fp, metadata !14, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i8]* %buffer, metadata !80, metadata !DIExpression()), !dbg !84
  %0 = bitcast [10 x i8]* %buffer to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !84
  %call = call %struct.__sFILE* @"\01_fopen"(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  store %struct.__sFILE* %call, %struct.__sFILE** %fp, align 8, !dbg !86
  %1 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8, !dbg !87
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !88
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i8* noundef %arraydecay), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #3

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/Unsafe_IoFunction_of_Stream_Buffer_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "Unsafe_IoFunction_of_Stream_Buffer_case01_Bad_03", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/Unsafe_IoFunction_of_Stream_Buffer_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "fp", scope: !9, file: !10, line: 10, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !17, line: 157, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !17, line: 126, size: 1216, elements: !19)
!19 = !{!20, !23, !25, !26, !28, !29, !34, !35, !37, !41, !47, !57, !63, !64, !67, !68, !72, !76, !77, !78}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !18, file: !17, line: 127, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !18, file: !17, line: 128, baseType: !24, size: 32, offset: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !18, file: !17, line: 129, baseType: !24, size: 32, offset: 96)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !18, file: !17, line: 130, baseType: !27, size: 16, offset: 128)
!27 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !18, file: !17, line: 131, baseType: !27, size: 16, offset: 144)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !18, file: !17, line: 132, baseType: !30, size: 128, offset: 192)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !17, line: 92, size: 128, elements: !31)
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !30, file: !17, line: 93, baseType: !21, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !30, file: !17, line: 94, baseType: !24, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !18, file: !17, line: 133, baseType: !24, size: 32, offset: 320)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !18, file: !17, line: 136, baseType: !36, size: 64, offset: 384)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !18, file: !17, line: 137, baseType: !38, size: 64, offset: 448)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DISubroutineType(types: !40)
!40 = !{!24, !36}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !18, file: !17, line: 138, baseType: !42, size: 64, offset: 512)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DISubroutineType(types: !44)
!44 = !{!24, !36, !45, !24}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !18, file: !17, line: 139, baseType: !48, size: 64, offset: 576)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !36, !51, !24}
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !17, line: 81, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !53, line: 71, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !55, line: 48, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!56 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !18, file: !17, line: 140, baseType: !58, size: 64, offset: 640)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DISubroutineType(types: !60)
!60 = !{!24, !36, !61, !24}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !18, file: !17, line: 143, baseType: !30, size: 128, offset: 704)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !18, file: !17, line: 144, baseType: !65, size: 64, offset: 832)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !17, line: 98, flags: DIFlagFwdDecl)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !18, file: !17, line: 145, baseType: !24, size: 32, offset: 896)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !18, file: !17, line: 148, baseType: !69, size: 24, offset: 928)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 24, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 3)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !18, file: !17, line: 149, baseType: !73, size: 8, offset: 952)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 8, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 1)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !18, file: !17, line: 152, baseType: !30, size: 128, offset: 960)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !18, file: !17, line: 155, baseType: !24, size: 32, offset: 1088)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !18, file: !17, line: 156, baseType: !51, size: 64, offset: 1152)
!79 = !DILocation(line: 10, column: 8, scope: !9)
!80 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 11, type: !81)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 80, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 10)
!84 = !DILocation(line: 11, column: 7, scope: !9)
!85 = !DILocation(line: 12, column: 7, scope: !9)
!86 = !DILocation(line: 12, column: 5, scope: !9)
!87 = !DILocation(line: 14, column: 12, scope: !9)
!88 = !DILocation(line: 14, column: 20, scope: !9)
!89 = !DILocation(line: 14, column: 5, scope: !9)
!90 = !DILocation(line: 15, column: 1, scope: !9)
