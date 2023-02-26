; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32* %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  br label %LOOP, !dbg !17

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !18), !dbg !19
  %0 = load i32*, i32** %i.addr, align 8, !dbg !20
  %1 = load i32, i32* %0, align 4, !dbg !21
  %add = add nsw i32 %1, 1, !dbg !22
  %2 = load i32*, i32** %i.addr, align 8, !dbg !23
  store i32 %add, i32* %2, align 4, !dbg !24
  %3 = load i32*, i32** %i.addr, align 8, !dbg !25
  %4 = load i32, i32* %3, align 4, !dbg !27
  %cmp = icmp slt i32 %4, 10, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %LOOP
  br label %LOOP, !dbg !30

if.end:                                           ; preds = %LOOP
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !33 {
entry:
  %buffer = alloca [20 x i32], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [20 x i32]* %buffer, metadata !36, metadata !DIExpression()), !dbg !40
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !41
  call void @srand(i32 %call) #4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !44
  %call1 = call i32 @rand() #4, !dbg !45
  %rem = srem i32 %call1, 51, !dbg !46
  store i32 %rem, i32* %i, align 4, !dbg !44
  call void @foo(i32* %i), !dbg !47
  %0 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %0 to i64, !dbg !49
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx, align 4, !dbg !50
  ret i32 0, !dbg !51
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 15, scope: !9)
!17 = !DILocation(line: 7, column: 18, scope: !9)
!18 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 8)
!19 = !DILocation(line: 8, column: 5, scope: !9)
!20 = !DILocation(line: 9, column: 11, scope: !9)
!21 = !DILocation(line: 9, column: 10, scope: !9)
!22 = !DILocation(line: 9, column: 13, scope: !9)
!23 = !DILocation(line: 9, column: 6, scope: !9)
!24 = !DILocation(line: 9, column: 8, scope: !9)
!25 = !DILocation(line: 10, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!27 = !DILocation(line: 10, column: 8, scope: !26)
!28 = !DILocation(line: 10, column: 11, scope: !26)
!29 = !DILocation(line: 10, column: 8, scope: !9)
!30 = !DILocation(line: 11, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !10, line: 10, column: 17)
!32 = !DILocation(line: 13, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !34, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!14}
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !10, line: 16, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 640, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 20)
!40 = !DILocation(line: 16, column: 6, scope: !33)
!41 = !DILocation(line: 17, column: 11, scope: !33)
!42 = !DILocation(line: 17, column: 5, scope: !33)
!43 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 18, type: !14)
!44 = !DILocation(line: 18, column: 9, scope: !33)
!45 = !DILocation(line: 18, column: 13, scope: !33)
!46 = !DILocation(line: 18, column: 20, scope: !33)
!47 = !DILocation(line: 20, column: 5, scope: !33)
!48 = !DILocation(line: 22, column: 9, scope: !33)
!49 = !DILocation(line: 22, column: 2, scope: !33)
!50 = !DILocation(line: 22, column: 12, scope: !33)
!51 = !DILocation(line: 23, column: 1, scope: !33)
