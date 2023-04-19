; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/PointBuffOverflow_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/PointBuffOverflow_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"file\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe823_c_02() #0 !dbg !11 {
entry:
  %szLineText = alloca [32 x i8], align 16
  %pszLineText = alloca i8*, align 8
  %iRetCh = alloca i32, align 4
  %fp = alloca %struct.__sFILE*, align 8
  call void @llvm.dbg.declare(metadata [32 x i8]* %szLineText, metadata !16, metadata !DIExpression()), !dbg !20
  %0 = bitcast [32 x i8]* %szLineText to i8*, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 32, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %pszLineText, metadata !21, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %szLineText, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %pszLineText, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %iRetCh, metadata !25, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %fp, metadata !28, metadata !DIExpression()), !dbg !90
  %call = call %struct.__sFILE* @"\01_fopen"(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  store %struct.__sFILE* %call, %struct.__sFILE** %fp, align 8, !dbg !90
  br label %while.cond, !dbg !92

while.cond:                                       ; preds = %while.body, %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8, !dbg !93
  %call1 = call i32 @feof(%struct.__sFILE* noundef %1), !dbg !94
  %tobool = icmp ne i32 %call1, 0, !dbg !94
  br i1 %tobool, label %land.end, label %land.rhs, !dbg !95

land.rhs:                                         ; preds = %while.cond
  %2 = load i32, i32* %iRetCh, align 4, !dbg !96
  %cmp = icmp ne i32 10, %2, !dbg !97
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ], !dbg !98
  br i1 %3, label %while.body, label %while.end, !dbg !92

while.body:                                       ; preds = %land.end
  %4 = load i32, i32* %iRetCh, align 4, !dbg !99
  %conv = trunc i32 %4 to i8, !dbg !101
  %5 = load i8*, i8** %pszLineText, align 8, !dbg !102
  store i8 %conv, i8* %5, align 1, !dbg !103
  %6 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8, !dbg !104
  %call2 = call i32 @fgetc(%struct.__sFILE* noundef %6), !dbg !105
  store i32 %call2, i32* %iRetCh, align 4, !dbg !106
  %7 = load i8*, i8** %pszLineText, align 8, !dbg !107
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !107
  store i8* %incdec.ptr, i8** %pszLineText, align 8, !dbg !107
  br label %while.cond, !dbg !92, !llvm.loop !108

while.end:                                        ; preds = %land.end
  %8 = load %struct.__sFILE*, %struct.__sFILE** %fp, align 8, !dbg !111
  %call3 = call i32 @fclose(%struct.__sFILE* noundef %8), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #3

declare i32 @feof(%struct.__sFILE* noundef) #3

declare i32 @fgetc(%struct.__sFILE* noundef) #3

declare i32 @fclose(%struct.__sFILE* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !114 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @cwe823_c_02(), !dbg !117
  ret i32 0, !dbg !118
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/PointBuffOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "cwe823_c_02", scope: !12, file: !12, line: 14, type: !13, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "function/PointBuffOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "szLineText", scope: !11, file: !12, line: 16, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 256, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 32)
!20 = !DILocation(line: 16, column: 10, scope: !11)
!21 = !DILocalVariable(name: "pszLineText", scope: !11, file: !12, line: 17, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 17, column: 11, scope: !11)
!24 = !DILocation(line: 17, column: 25, scope: !11)
!25 = !DILocalVariable(name: "iRetCh", scope: !11, file: !12, line: 18, type: !26)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DILocation(line: 18, column: 9, scope: !11)
!28 = !DILocalVariable(name: "fp", scope: !11, file: !12, line: 19, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !31, line: 157, baseType: !32)
!31 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !31, line: 126, size: 1216, elements: !33)
!33 = !{!34, !37, !38, !39, !41, !42, !47, !48, !50, !54, !58, !68, !74, !75, !78, !79, !83, !87, !88, !89}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !32, file: !31, line: 127, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !32, file: !31, line: 128, baseType: !26, size: 32, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !32, file: !31, line: 129, baseType: !26, size: 32, offset: 96)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !32, file: !31, line: 130, baseType: !40, size: 16, offset: 128)
!40 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !32, file: !31, line: 131, baseType: !40, size: 16, offset: 144)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !32, file: !31, line: 132, baseType: !43, size: 128, offset: 192)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !31, line: 92, size: 128, elements: !44)
!44 = !{!45, !46}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !43, file: !31, line: 93, baseType: !35, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !43, file: !31, line: 94, baseType: !26, size: 32, offset: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !32, file: !31, line: 133, baseType: !26, size: 32, offset: 320)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !32, file: !31, line: 136, baseType: !49, size: 64, offset: 384)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !32, file: !31, line: 137, baseType: !51, size: 64, offset: 448)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DISubroutineType(types: !53)
!53 = !{!26, !49}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !32, file: !31, line: 138, baseType: !55, size: 64, offset: 512)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DISubroutineType(types: !57)
!57 = !{!26, !49, !22, !26}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !32, file: !31, line: 139, baseType: !59, size: 64, offset: 576)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !49, !62, !26}
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !31, line: 81, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !64, line: 71, baseType: !65)
!64 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !66, line: 48, baseType: !67)
!66 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!67 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !32, file: !31, line: 140, baseType: !69, size: 64, offset: 640)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DISubroutineType(types: !71)
!71 = !{!26, !49, !72, !26}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !32, file: !31, line: 143, baseType: !43, size: 128, offset: 704)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !32, file: !31, line: 144, baseType: !76, size: 64, offset: 832)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !31, line: 98, flags: DIFlagFwdDecl)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !32, file: !31, line: 145, baseType: !26, size: 32, offset: 896)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !32, file: !31, line: 148, baseType: !80, size: 24, offset: 928)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 24, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 3)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !32, file: !31, line: 149, baseType: !84, size: 8, offset: 952)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 8, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 1)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !32, file: !31, line: 152, baseType: !43, size: 128, offset: 960)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !32, file: !31, line: 155, baseType: !26, size: 32, offset: 1088)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !32, file: !31, line: 156, baseType: !62, size: 64, offset: 1152)
!90 = !DILocation(line: 19, column: 11, scope: !11)
!91 = !DILocation(line: 19, column: 16, scope: !11)
!92 = !DILocation(line: 20, column: 5, scope: !11)
!93 = !DILocation(line: 20, column: 18, scope: !11)
!94 = !DILocation(line: 20, column: 13, scope: !11)
!95 = !DILocation(line: 20, column: 22, scope: !11)
!96 = !DILocation(line: 20, column: 34, scope: !11)
!97 = !DILocation(line: 20, column: 31, scope: !11)
!98 = !DILocation(line: 0, scope: !11)
!99 = !DILocation(line: 22, column: 30, scope: !100)
!100 = distinct !DILexicalBlock(scope: !11, file: !12, line: 20, column: 43)
!101 = !DILocation(line: 22, column: 24, scope: !100)
!102 = !DILocation(line: 22, column: 10, scope: !100)
!103 = !DILocation(line: 22, column: 22, scope: !100)
!104 = !DILocation(line: 23, column: 24, scope: !100)
!105 = !DILocation(line: 23, column: 18, scope: !100)
!106 = !DILocation(line: 23, column: 16, scope: !100)
!107 = !DILocation(line: 24, column: 20, scope: !100)
!108 = distinct !{!108, !92, !109, !110}
!109 = !DILocation(line: 25, column: 5, scope: !11)
!110 = !{!"llvm.loop.mustprogress"}
!111 = !DILocation(line: 26, column: 12, scope: !11)
!112 = !DILocation(line: 26, column: 5, scope: !11)
!113 = !DILocation(line: 27, column: 1, scope: !11)
!114 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 28, type: !115, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!115 = !DISubroutineType(types: !116)
!116 = !{!26}
!117 = !DILocation(line: 30, column: 5, scope: !114)
!118 = !DILocation(line: 31, column: 5, scope: !114)
