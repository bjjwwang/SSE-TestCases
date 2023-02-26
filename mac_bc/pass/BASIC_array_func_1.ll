; ModuleID = 'mac_bc/pass/BASIC_array_func_1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @getValue(i32** noundef %arr, i32 noundef %x, i32 noundef %y) #0 !dbg !9 {
entry:
  %arr.addr = alloca i32**, align 8
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32** %arr, i32*** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %arr.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32**, i32*** %arr.addr, align 8, !dbg !23
  %1 = load i32, i32* %x.addr, align 4, !dbg !24
  %idxprom = sext i32 %1 to i64, !dbg !23
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 %idxprom, !dbg !23
  %2 = load i32*, i32** %arrayidx, align 8, !dbg !23
  %3 = load i32, i32* %y.addr, align 4, !dbg !25
  %idxprom1 = sext i32 %3 to i64, !dbg !23
  %arrayidx2 = getelementptr inbounds i32, i32* %2, i64 %idxprom1, !dbg !23
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !23
  ret i32 %4, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %v = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %arr, metadata !30, metadata !DIExpression()), !dbg !34
  %arrayidx = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr, i64 0, i64 0, !dbg !35
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx, i64 0, i64 0, !dbg !35
  store i32 10, i32* %arrayidx1, align 16, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %v, metadata !37, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr, i64 0, i64 0, !dbg !39
  %0 = bitcast [2 x i32]* %arraydecay to i32**, !dbg !39
  %call = call i32 @getValue(i32** noundef %0, i32 noundef 0, i32 noundef 0), !dbg !40
  store i32 %call, i32* %v, align 4, !dbg !38
  %1 = load i32, i32* %v, align 4, !dbg !41
  %cmp = icmp eq i32 %1, 10, !dbg !42
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !43
  ret i32 0, !dbg !44
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = !{}
!17 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 8, type: !14)
!18 = !DILocation(line: 8, column: 20, scope: !9)
!19 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!20 = !DILocation(line: 8, column: 29, scope: !9)
!21 = !DILocalVariable(name: "y", arg: 3, scope: !9, file: !10, line: 8, type: !13)
!22 = !DILocation(line: 8, column: 36, scope: !9)
!23 = !DILocation(line: 9, column: 12, scope: !9)
!24 = !DILocation(line: 9, column: 16, scope: !9)
!25 = !DILocation(line: 9, column: 19, scope: !9)
!26 = !DILocation(line: 9, column: 5, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !28, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!28 = !DISubroutineType(types: !29)
!29 = !{!13}
!30 = !DILocalVariable(name: "arr", scope: !27, file: !10, line: 13, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !32)
!32 = !{!33, !33}
!33 = !DISubrange(count: 2)
!34 = !DILocation(line: 13, column: 9, scope: !27)
!35 = !DILocation(line: 14, column: 5, scope: !27)
!36 = !DILocation(line: 14, column: 15, scope: !27)
!37 = !DILocalVariable(name: "v", scope: !27, file: !10, line: 15, type: !13)
!38 = !DILocation(line: 15, column: 9, scope: !27)
!39 = !DILocation(line: 15, column: 22, scope: !27)
!40 = !DILocation(line: 15, column: 13, scope: !27)
!41 = !DILocation(line: 16, column: 16, scope: !27)
!42 = !DILocation(line: 16, column: 18, scope: !27)
!43 = !DILocation(line: 16, column: 5, scope: !27)
!44 = !DILocation(line: 17, column: 5, scope: !27)
