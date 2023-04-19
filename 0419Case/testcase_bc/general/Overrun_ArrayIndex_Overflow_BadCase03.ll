; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/Overrun_ArrayIndex_Overflow_BadCase03.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_ArrayIndex_Overflow_BadCase03.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad03(i32* noundef %x, i32 noundef %n) #0 !dbg !9 {
entry:
  %x.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** %x.addr, align 8, !dbg !20
  %1 = load i32, i32* %n.addr, align 4, !dbg !21
  %sub = sub nsw i32 %1, 1, !dbg !22
  %idxprom = sext i32 %sub to i64, !dbg !20
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !20
  store i32 1, i32* %arrayidx, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyFunc(i32 noundef %n) #0 !dbg !25 {
entry:
  %n.addr = alloca i32, align 4
  %array = alloca [10 x i32], align 16
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [10 x i32]* %array, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = bitcast [10 x i32]* %array to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !34
  %1 = load i32, i32* %n.addr, align 4, !dbg !35
  %cmp = icmp slt i32 %1, 100, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %array, i64 0, i64 0, !dbg !39
  %2 = load i32, i32* %n.addr, align 4, !dbg !41
  call void @TestCaseBad03(i32* noundef %arraydecay, i32 noundef %2), !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_ArrayIndex_Overflow_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestCaseBad03", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "general/Overrun_ArrayIndex_Overflow_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !14}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 25, scope: !9)
!18 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !10, line: 9, type: !14)
!19 = !DILocation(line: 9, column: 32, scope: !9)
!20 = !DILocation(line: 12, column: 5, scope: !9)
!21 = !DILocation(line: 12, column: 7, scope: !9)
!22 = !DILocation(line: 12, column: 9, scope: !9)
!23 = !DILocation(line: 12, column: 14, scope: !9)
!24 = !DILocation(line: 13, column: 1, scope: !9)
!25 = distinct !DISubprogram(name: "MyFunc", scope: !10, file: !10, line: 15, type: !26, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !14}
!28 = !DILocalVariable(name: "n", arg: 1, scope: !25, file: !10, line: 15, type: !14)
!29 = !DILocation(line: 15, column: 17, scope: !25)
!30 = !DILocalVariable(name: "array", scope: !25, file: !10, line: 17, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 10)
!34 = !DILocation(line: 17, column: 9, scope: !25)
!35 = !DILocation(line: 18, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !25, file: !10, line: 18, column: 9)
!37 = !DILocation(line: 18, column: 11, scope: !36)
!38 = !DILocation(line: 18, column: 9, scope: !25)
!39 = !DILocation(line: 20, column: 23, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 18, column: 18)
!41 = !DILocation(line: 20, column: 30, scope: !40)
!42 = !DILocation(line: 20, column: 9, scope: !40)
!43 = !DILocation(line: 21, column: 5, scope: !40)
!44 = !DILocation(line: 22, column: 1, scope: !25)
