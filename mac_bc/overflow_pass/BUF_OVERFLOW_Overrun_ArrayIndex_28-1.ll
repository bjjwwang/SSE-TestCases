; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_28-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_28-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @digitCount(i32 noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %counter, align 4, !dbg !18
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 0, !dbg !20
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !21

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !21

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4, !dbg !22
  %conv = sitofp i32 %1 to double, !dbg !22
  %2 = call double @llvm.log10.f64(double %conv), !dbg !23
  %add = fadd double %2, 1.000000e+00, !dbg !24
  br label %cond.end, !dbg !21

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %add, %cond.false ], !dbg !21
  %conv1 = fptosi double %cond to i32, !dbg !21
  store i32 %conv1, i32* %counter, align 4, !dbg !25
  %3 = load i32, i32* %counter, align 4, !dbg !26
  ret i32 %3, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.log10.f64(double) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i32], align 16
  %buffer2 = alloca [3 x i32], align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %buffer1, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer2, metadata !36, metadata !DIExpression()), !dbg !40
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !41
  call void @srand(i32 noundef %call), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !43, metadata !DIExpression()), !dbg !44
  %call1 = call i32 @rand(), !dbg !45
  %rem = srem i32 %call1, 999, !dbg !46
  store i32 %rem, i32* %randomNumber, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32, i32* %randomNumber, align 4, !dbg !49
  %call2 = call i32 @digitCount(i32 noundef %0), !dbg !50
  store i32 %call2, i32* %counter, align 4, !dbg !48
  %1 = load i32, i32* %counter, align 4, !dbg !51
  %cmp = icmp eq i32 %1, 3, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !55
  %idxprom = sext i32 %2 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !57
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  %3 = load i32, i32* %counter, align 4, !dbg !59
  %idxprom3 = sext i32 %3 to i64, !dbg !60
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !60
  store i32 1, i32* %arrayidx4, align 4, !dbg !61
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !63
  ret i32 %4, !dbg !63
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_28-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_28-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 20, scope: !9)
!17 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 9, scope: !9)
!19 = !DILocation(line: 10, column: 16, scope: !9)
!20 = !DILocation(line: 10, column: 18, scope: !9)
!21 = !DILocation(line: 10, column: 15, scope: !9)
!22 = !DILocation(line: 10, column: 35, scope: !9)
!23 = !DILocation(line: 10, column: 29, scope: !9)
!24 = !DILocation(line: 10, column: 38, scope: !9)
!25 = !DILocation(line: 10, column: 13, scope: !9)
!26 = !DILocation(line: 11, column: 12, scope: !9)
!27 = !DILocation(line: 11, column: 5, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !29, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DISubroutineType(types: !30)
!30 = !{!13}
!31 = !DILocalVariable(name: "buffer1", scope: !28, file: !10, line: 15, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 4)
!35 = !DILocation(line: 15, column: 6, scope: !28)
!36 = !DILocalVariable(name: "buffer2", scope: !28, file: !10, line: 16, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 3)
!40 = !DILocation(line: 16, column: 6, scope: !28)
!41 = !DILocation(line: 17, column: 11, scope: !28)
!42 = !DILocation(line: 17, column: 5, scope: !28)
!43 = !DILocalVariable(name: "randomNumber", scope: !28, file: !10, line: 18, type: !13)
!44 = !DILocation(line: 18, column: 6, scope: !28)
!45 = !DILocation(line: 18, column: 21, scope: !28)
!46 = !DILocation(line: 18, column: 28, scope: !28)
!47 = !DILocalVariable(name: "counter", scope: !28, file: !10, line: 19, type: !13)
!48 = !DILocation(line: 19, column: 9, scope: !28)
!49 = !DILocation(line: 19, column: 30, scope: !28)
!50 = !DILocation(line: 19, column: 19, scope: !28)
!51 = !DILocation(line: 21, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !28, file: !10, line: 21, column: 5)
!53 = !DILocation(line: 21, column: 13, scope: !52)
!54 = !DILocation(line: 21, column: 5, scope: !28)
!55 = !DILocation(line: 22, column: 11, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 21, column: 19)
!57 = !DILocation(line: 22, column: 3, scope: !56)
!58 = !DILocation(line: 22, column: 20, scope: !56)
!59 = !DILocation(line: 23, column: 11, scope: !56)
!60 = !DILocation(line: 23, column: 3, scope: !56)
!61 = !DILocation(line: 23, column: 20, scope: !56)
!62 = !DILocation(line: 24, column: 2, scope: !56)
!63 = !DILocation(line: 25, column: 1, scope: !28)
