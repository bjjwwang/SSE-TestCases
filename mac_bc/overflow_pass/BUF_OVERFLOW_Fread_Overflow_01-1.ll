; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Fread_Overflow_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Fread_Overflow_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %fptr = alloca %struct.__sFILE*, align 8
  %count = alloca i64, align 8
  %buf = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %fptr, metadata !17, metadata !DIExpression()), !dbg !80
  %call = call %struct.__sFILE* @"\01_fopen"(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  store %struct.__sFILE* %call, %struct.__sFILE** %fptr, align 8, !dbg !80
  %0 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !82
  %cmp = icmp ne %struct.__sFILE* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !86
  %call1 = call i32 @fseek(%struct.__sFILE* noundef %1, i64 noundef 0, i32 noundef 2), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %count, metadata !89, metadata !DIExpression()), !dbg !91
  %2 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !92
  %call2 = call i64 @ftell(%struct.__sFILE* noundef %2), !dbg !93
  store i64 %call2, i64* %count, align 8, !dbg !91
  %3 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !94
  %call3 = call i32 @fseek(%struct.__sFILE* noundef %3, i64 noundef 0, i32 noundef 0), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !96, metadata !DIExpression()), !dbg !97
  %call4 = call i8* @malloc(i64 noundef 1000) #4, !dbg !98
  store i8* %call4, i8** %buf, align 8, !dbg !97
  %4 = load i8*, i8** %buf, align 8, !dbg !99
  %5 = load i64, i64* %count, align 8, !dbg !100
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !101
  %call5 = call i64 @fread(i8* noundef %4, i64 noundef 1, i64 noundef %5, %struct.__sFILE* noundef %6), !dbg !102
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !104
  ret i32 %7, !dbg !104
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #2

declare i32 @fseek(%struct.__sFILE* noundef, i64 noundef, i32 noundef) #2

declare i64 @ftell(%struct.__sFILE* noundef) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct.__sFILE* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Fread_Overflow_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 7, type: !13, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!12 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Fread_Overflow_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{}
!17 = !DILocalVariable(name: "fptr", scope: !11, file: !12, line: 8, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !20, line: 157, baseType: !21)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !20, line: 126, size: 1216, elements: !22)
!22 = !{!23, !26, !27, !28, !30, !31, !36, !37, !38, !42, !48, !58, !64, !65, !68, !69, !73, !77, !78, !79}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !21, file: !20, line: 127, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !21, file: !20, line: 128, baseType: !15, size: 32, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !21, file: !20, line: 129, baseType: !15, size: 32, offset: 96)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !21, file: !20, line: 130, baseType: !29, size: 16, offset: 128)
!29 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !21, file: !20, line: 131, baseType: !29, size: 16, offset: 144)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !21, file: !20, line: 132, baseType: !32, size: 128, offset: 192)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !20, line: 92, size: 128, elements: !33)
!33 = !{!34, !35}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !32, file: !20, line: 93, baseType: !24, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !32, file: !20, line: 94, baseType: !15, size: 32, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !21, file: !20, line: 133, baseType: !15, size: 32, offset: 320)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !21, file: !20, line: 136, baseType: !3, size: 64, offset: 384)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !21, file: !20, line: 137, baseType: !39, size: 64, offset: 448)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DISubroutineType(types: !41)
!41 = !{!15, !3}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !21, file: !20, line: 138, baseType: !43, size: 64, offset: 512)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DISubroutineType(types: !45)
!45 = !{!15, !3, !46, !15}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !21, file: !20, line: 139, baseType: !49, size: 64, offset: 576)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !3, !52, !15}
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !20, line: 81, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !54, line: 71, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !56, line: 48, baseType: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!57 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !21, file: !20, line: 140, baseType: !59, size: 64, offset: 640)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!15, !3, !62, !15}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !47)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !21, file: !20, line: 143, baseType: !32, size: 128, offset: 704)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !21, file: !20, line: 144, baseType: !66, size: 64, offset: 832)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !20, line: 98, flags: DIFlagFwdDecl)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !21, file: !20, line: 145, baseType: !15, size: 32, offset: 896)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !21, file: !20, line: 148, baseType: !70, size: 24, offset: 928)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 24, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 3)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !21, file: !20, line: 149, baseType: !74, size: 8, offset: 952)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 8, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 1)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !21, file: !20, line: 152, baseType: !32, size: 128, offset: 960)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !21, file: !20, line: 155, baseType: !15, size: 32, offset: 1088)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !21, file: !20, line: 156, baseType: !52, size: 64, offset: 1152)
!80 = !DILocation(line: 8, column: 11, scope: !11)
!81 = !DILocation(line: 8, column: 18, scope: !11)
!82 = !DILocation(line: 9, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !11, file: !12, line: 9, column: 8)
!84 = !DILocation(line: 9, column: 13, scope: !83)
!85 = !DILocation(line: 9, column: 8, scope: !11)
!86 = !DILocation(line: 10, column: 15, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 9, column: 22)
!88 = !DILocation(line: 10, column: 9, scope: !87)
!89 = !DILocalVariable(name: "count", scope: !87, file: !12, line: 11, type: !90)
!90 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!91 = !DILocation(line: 11, column: 14, scope: !87)
!92 = !DILocation(line: 11, column: 28, scope: !87)
!93 = !DILocation(line: 11, column: 22, scope: !87)
!94 = !DILocation(line: 12, column: 15, scope: !87)
!95 = !DILocation(line: 12, column: 9, scope: !87)
!96 = !DILocalVariable(name: "buf", scope: !87, file: !12, line: 13, type: !46)
!97 = !DILocation(line: 13, column: 15, scope: !87)
!98 = !DILocation(line: 13, column: 21, scope: !87)
!99 = !DILocation(line: 14, column: 15, scope: !87)
!100 = !DILocation(line: 14, column: 34, scope: !87)
!101 = !DILocation(line: 14, column: 41, scope: !87)
!102 = !DILocation(line: 14, column: 9, scope: !87)
!103 = !DILocation(line: 15, column: 5, scope: !87)
!104 = !DILocation(line: 16, column: 1, scope: !11)
