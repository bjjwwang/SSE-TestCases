; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/TlvBuffOverflow_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/TlvBuffOverflow_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._s = type { i32, [0 x i8] }

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe823_c_01(%struct._s* noundef %pstReq) #0 !dbg !12 {
entry:
  %pstReq.addr = alloca %struct._s*, align 8
  %pucData = alloca i8*, align 8
  %ulLen = alloca i32, align 4
  store %struct._s* %pstReq, %struct._s** %pstReq.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._s** %pstReq.addr, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i8** %pucData, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load %struct._s*, %struct._s** %pstReq.addr, align 8, !dbg !31
  %1 = bitcast %struct._s* %0 to i8*, !dbg !32
  store i8* %1, i8** %pucData, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %ulLen, metadata !33, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %ulLen, align 4, !dbg !35
  %2 = load %struct._s*, %struct._s** %pstReq.addr, align 8, !dbg !36
  %ucIdLength = getelementptr inbounds %struct._s, %struct._s* %2, i32 0, i32 0, !dbg !37
  %3 = load i32, i32* %ucIdLength, align 4, !dbg !37
  store i32 %3, i32* %ulLen, align 4, !dbg !38
  %4 = load i8*, i8** %pucData, align 8, !dbg !39
  %5 = load i32, i32* %ulLen, align 4, !dbg !40
  %idx.ext = zext i32 %5 to i64, !dbg !41
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext, !dbg !41
  store i8* %add.ptr, i8** %pucData, align 8, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %pstReq = alloca %struct._s*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata %struct._s** %pstReq, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load %struct._s*, %struct._s** %pstReq, align 8, !dbg !54
  call void @cwe823_c_01(%struct._s* noundef %0), !dbg !55
  ret i32 0, !dbg !56
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/TlvBuffOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "cwe823_c_01", scope: !13, file: !13, line: 18, type: !14, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !26)
!13 = !DIFile(filename: "general/TlvBuffOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "Req", file: !13, line: 12, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_s", file: !13, line: 9, size: 32, elements: !19)
!19 = !{!20, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "ucIdLength", scope: !18, file: !13, line: 10, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !18, file: !13, line: 11, baseType: !23, offset: 32)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 0)
!26 = !{}
!27 = !DILocalVariable(name: "pstReq", arg: 1, scope: !12, file: !13, line: 18, type: !16)
!28 = !DILocation(line: 18, column: 23, scope: !12)
!29 = !DILocalVariable(name: "pucData", scope: !12, file: !13, line: 20, type: !3)
!30 = !DILocation(line: 20, column: 8, scope: !12)
!31 = !DILocation(line: 20, column: 26, scope: !12)
!32 = !DILocation(line: 20, column: 18, scope: !12)
!33 = !DILocalVariable(name: "ulLen", scope: !12, file: !13, line: 21, type: !34)
!34 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 21, column: 15, scope: !12)
!36 = !DILocation(line: 22, column: 10, scope: !12)
!37 = !DILocation(line: 22, column: 18, scope: !12)
!38 = !DILocation(line: 22, column: 8, scope: !12)
!39 = !DILocation(line: 24, column: 12, scope: !12)
!40 = !DILocation(line: 24, column: 22, scope: !12)
!41 = !DILocation(line: 24, column: 20, scope: !12)
!42 = !DILocation(line: 24, column: 10, scope: !12)
!43 = !DILocation(line: 25, column: 1, scope: !12)
!44 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 26, type: !45, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !26)
!45 = !DISubroutineType(types: !46)
!46 = !{!21, !21, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !13, line: 26, type: !21)
!49 = !DILocation(line: 26, column: 14, scope: !44)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !13, line: 26, type: !47)
!51 = !DILocation(line: 26, column: 27, scope: !44)
!52 = !DILocalVariable(name: "pstReq", scope: !44, file: !13, line: 28, type: !16)
!53 = !DILocation(line: 28, column: 7, scope: !44)
!54 = !DILocation(line: 29, column: 14, scope: !44)
!55 = !DILocation(line: 29, column: 2, scope: !44)
!56 = !DILocation(line: 30, column: 2, scope: !44)
