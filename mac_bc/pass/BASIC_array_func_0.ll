; ModuleID = 'mac_bc/pass/BASIC_array_func_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @getValue(i32* noundef %arr, i32 noundef %idx) #0 !dbg !9 {
entry:
  %arr.addr = alloca i32*, align 8
  %idx.addr = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %arr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 %idx, i32* %idx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %idx.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** %arr.addr, align 8, !dbg !20
  %1 = load i32, i32* %idx.addr, align 4, !dbg !21
  %idxprom = sext i32 %1 to i64, !dbg !20
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !20
  %2 = load i32, i32* %arrayidx, align 4, !dbg !20
  ret i32 %2, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !23 {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [2 x i32], align 4
  %v = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %arr, metadata !26, metadata !DIExpression()), !dbg !30
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %arr, i64 0, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %arr, i64 0, i64 1, !dbg !33
  store i32 1, i32* %arrayidx1, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %v, metadata !35, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [2 x i32], [2 x i32]* %arr, i64 0, i64 0, !dbg !37
  %call = call i32 @getValue(i32* noundef %arraydecay, i32 noundef 1), !dbg !38
  store i32 %call, i32* %v, align 4, !dbg !36
  %0 = load i32, i32* %v, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 1, !dbg !40
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !41
  ret i32 0, !dbg !42
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!15 = !{}
!16 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 8, type: !14)
!17 = !DILocation(line: 8, column: 19, scope: !9)
!18 = !DILocalVariable(name: "idx", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!19 = !DILocation(line: 8, column: 28, scope: !9)
!20 = !DILocation(line: 9, column: 12, scope: !9)
!21 = !DILocation(line: 9, column: 16, scope: !9)
!22 = !DILocation(line: 9, column: 5, scope: !9)
!23 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !24, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!24 = !DISubroutineType(types: !25)
!25 = !{!13}
!26 = !DILocalVariable(name: "arr", scope: !23, file: !10, line: 13, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 2)
!30 = !DILocation(line: 13, column: 9, scope: !23)
!31 = !DILocation(line: 14, column: 5, scope: !23)
!32 = !DILocation(line: 14, column: 12, scope: !23)
!33 = !DILocation(line: 15, column: 5, scope: !23)
!34 = !DILocation(line: 15, column: 12, scope: !23)
!35 = !DILocalVariable(name: "v", scope: !23, file: !10, line: 16, type: !13)
!36 = !DILocation(line: 16, column: 9, scope: !23)
!37 = !DILocation(line: 16, column: 22, scope: !23)
!38 = !DILocation(line: 16, column: 13, scope: !23)
!39 = !DILocation(line: 17, column: 16, scope: !23)
!40 = !DILocation(line: 17, column: 18, scope: !23)
!41 = !DILocation(line: 17, column: 5, scope: !23)
!42 = !DILocation(line: 18, column: 5, scope: !23)
