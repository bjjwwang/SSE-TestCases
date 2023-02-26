; ModuleID = 'linux_bc/pass/BASIC_array_func_4.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getValue(i32* %arr, i32 %x) #0 !dbg !9 {
entry:
  %arr.addr = alloca i32*, align 8
  %x.addr = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %arr.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** %arr.addr, align 8, !dbg !19
  %1 = load i32, i32* %x.addr, align 4, !dbg !20
  %idxprom = sext i32 %1 to i64, !dbg !19
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom, !dbg !19
  %2 = load i32, i32* %arrayidx, align 4, !dbg !19
  ret i32 %2, !dbg !21
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !22 {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [2 x i32], align 4
  %res = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %arr, metadata !25, metadata !DIExpression()), !dbg !29
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %arr, i64 0, i64 0, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %arr, i64 0, i64 1, !dbg !32
  store i32 1, i32* %arrayidx1, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %res, metadata !34, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [2 x i32], [2 x i32]* %arr, i64 0, i64 0, !dbg !36
  %call = call i32 @getValue(i32* %arraydecay, i32 1), !dbg !37
  store i32 %call, i32* %res, align 4, !dbg !35
  %0 = load i32, i32* %res, align 4, !dbg !38
  %cmp = icmp eq i32 %0, 1, !dbg !39
  call void @svf_assert(i1 zeroext %cmp), !dbg !40
  ret i32 0, !dbg !41
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_4.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_4.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!15 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 9, type: !14)
!16 = !DILocation(line: 9, column: 19, scope: !9)
!17 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 28, scope: !9)
!19 = !DILocation(line: 10, column: 12, scope: !9)
!20 = !DILocation(line: 10, column: 16, scope: !9)
!21 = !DILocation(line: 10, column: 5, scope: !9)
!22 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !23, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!13}
!25 = !DILocalVariable(name: "arr", scope: !22, file: !10, line: 14, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 2)
!29 = !DILocation(line: 14, column: 9, scope: !22)
!30 = !DILocation(line: 15, column: 5, scope: !22)
!31 = !DILocation(line: 15, column: 12, scope: !22)
!32 = !DILocation(line: 16, column: 5, scope: !22)
!33 = !DILocation(line: 16, column: 12, scope: !22)
!34 = !DILocalVariable(name: "res", scope: !22, file: !10, line: 17, type: !13)
!35 = !DILocation(line: 17, column: 9, scope: !22)
!36 = !DILocation(line: 17, column: 24, scope: !22)
!37 = !DILocation(line: 17, column: 15, scope: !22)
!38 = !DILocation(line: 18, column: 16, scope: !22)
!39 = !DILocation(line: 18, column: 20, scope: !22)
!40 = !DILocation(line: 18, column: 5, scope: !22)
!41 = !DILocation(line: 19, column: 5, scope: !22)
