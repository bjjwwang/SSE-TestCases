; ModuleID = 'linux_bc/pass/BASIC_array_func_6.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getValue([2 x i32]* %arr, i32 %x, i32 %y) #0 !dbg !9 {
entry:
  %arr.addr = alloca [2 x i32]*, align 8
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store [2 x i32]* %arr, [2 x i32]** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata [2 x i32]** %arr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load [2 x i32]*, [2 x i32]** %arr.addr, align 8, !dbg !24
  %1 = load i32, i32* %x.addr, align 4, !dbg !25
  %idxprom = sext i32 %1 to i64, !dbg !24
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %0, i64 %idxprom, !dbg !24
  %2 = load i32, i32* %y.addr, align 4, !dbg !26
  %idxprom1 = sext i32 %2 to i64, !dbg !24
  %arrayidx2 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx, i64 0, i64 %idxprom1, !dbg !24
  %3 = load i32, i32* %arrayidx2, align 4, !dbg !24
  ret i32 %3, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %v = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x [2 x i32]]* %arr, metadata !31, metadata !DIExpression()), !dbg !34
  %arrayidx = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr, i64 0, i64 0, !dbg !35
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx, i64 0, i64 0, !dbg !35
  store i32 10, i32* %arrayidx1, align 16, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %v, metadata !37, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %arr, i64 0, i64 0, !dbg !39
  %call = call i32 @getValue([2 x i32]* %arraydecay, i32 0, i32 0), !dbg !40
  store i32 %call, i32* %v, align 4, !dbg !38
  %0 = load i32, i32* %v, align 4, !dbg !41
  %cmp = icmp eq i32 %0, 10, !dbg !42
  call void @svf_assert(i1 zeroext %cmp), !dbg !43
  ret i32 0, !dbg !44
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_6.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_6.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 2)
!18 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 8, type: !14)
!19 = !DILocation(line: 8, column: 18, scope: !9)
!20 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!21 = !DILocation(line: 8, column: 33, scope: !9)
!22 = !DILocalVariable(name: "y", arg: 3, scope: !9, file: !10, line: 8, type: !13)
!23 = !DILocation(line: 8, column: 40, scope: !9)
!24 = !DILocation(line: 9, column: 12, scope: !9)
!25 = !DILocation(line: 9, column: 16, scope: !9)
!26 = !DILocation(line: 9, column: 19, scope: !9)
!27 = !DILocation(line: 9, column: 5, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !29, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!13}
!31 = !DILocalVariable(name: "arr", scope: !28, file: !10, line: 13, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !33)
!33 = !{!17, !17}
!34 = !DILocation(line: 13, column: 9, scope: !28)
!35 = !DILocation(line: 14, column: 5, scope: !28)
!36 = !DILocation(line: 14, column: 15, scope: !28)
!37 = !DILocalVariable(name: "v", scope: !28, file: !10, line: 15, type: !13)
!38 = !DILocation(line: 15, column: 9, scope: !28)
!39 = !DILocation(line: 15, column: 22, scope: !28)
!40 = !DILocation(line: 15, column: 13, scope: !28)
!41 = !DILocation(line: 16, column: 16, scope: !28)
!42 = !DILocation(line: 16, column: 18, scope: !28)
!43 = !DILocation(line: 16, column: 5, scope: !28)
!44 = !DILocation(line: 17, column: 5, scope: !28)
