; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [6 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 51, !dbg !25
  %sub = sub nsw i32 %rem, 25, !dbg !26
  store i32 %sub, i32* %a, align 4, !dbg !23
  %0 = load i32, i32* %a, align 4, !dbg !27
  %cmp = icmp sge i32 %0, 0, !dbg !29
  br i1 %cmp, label %if.then, label %if.else17, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %b, metadata !31, metadata !DIExpression()), !dbg !33
  %1 = load i32, i32* %a, align 4, !dbg !34
  store i32 %1, i32* %b, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !40
  %cmp2 = icmp slt i32 %2, 5, !dbg !42
  br i1 %cmp2, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %b, align 4, !dbg !44
  %inc = add nsw i32 %3, 1, !dbg !44
  store i32 %inc, i32* %b, align 4, !dbg !44
  %4 = load i32, i32* %b, align 4, !dbg !46
  %cmp3 = icmp sgt i32 %4, 10, !dbg !48
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !49

if.then4:                                         ; preds = %for.body
  br label %for.end, !dbg !50

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !53
  %inc5 = add nsw i32 %5, 1, !dbg !53
  store i32 %inc5, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %if.then4, %for.cond
  %6 = load i32, i32* %a, align 4, !dbg !58
  %cmp6 = icmp sgt i32 %6, 0, !dbg !60
  br i1 %cmp6, label %land.lhs.true, label %if.end16, !dbg !61

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %i, align 4, !dbg !62
  %cmp7 = icmp eq i32 %7, 5, !dbg !63
  br i1 %cmp7, label %land.lhs.true8, label %if.end16, !dbg !64

land.lhs.true8:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* %b, align 4, !dbg !65
  %rem9 = srem i32 %8, 2, !dbg !66
  %cmp10 = icmp eq i32 %rem9, 0, !dbg !67
  br i1 %cmp10, label %if.then11, label %if.end16, !dbg !68

if.then11:                                        ; preds = %land.lhs.true8
  %9 = load i32, i32* %a, align 4, !dbg !69
  %rem12 = srem i32 %9, 2, !dbg !72
  %tobool = icmp ne i32 %rem12, 0, !dbg !72
  br i1 %tobool, label %if.then13, label %if.else, !dbg !73

if.then13:                                        ; preds = %if.then11
  %10 = load i32, i32* %a, align 4, !dbg !74
  %idxprom = sext i32 %10 to i64, !dbg !76
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !76
  store i32 1, i32* %arrayidx, align 4, !dbg !77
  br label %if.end15, !dbg !78

if.else:                                          ; preds = %if.then11
  %arrayidx14 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 20, !dbg !79
  store i32 1, i32* %arrayidx14, align 16, !dbg !81
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then13
  br label %if.end16, !dbg !82

if.end16:                                         ; preds = %if.end15, %land.lhs.true8, %land.lhs.true, %for.end
  br label %if.end20, !dbg !83

if.else17:                                        ; preds = %entry
  %11 = load i32, i32* %a, align 4, !dbg !84
  %idxprom18 = sext i32 %11 to i64, !dbg !86
  %arrayidx19 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom18, !dbg !86
  store i32 1, i32* %arrayidx19, align 4, !dbg !87
  br label %if.end20

if.end20:                                         ; preds = %if.else17, %if.end16
  %12 = load i32, i32* %retval, align 4, !dbg !88
  ret i32 %12, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 6)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocation(line: 9, column: 11, scope: !9)
!21 = !DILocation(line: 9, column: 5, scope: !9)
!22 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocation(line: 10, column: 14, scope: !9)
!25 = !DILocation(line: 10, column: 21, scope: !9)
!26 = !DILocation(line: 10, column: 27, scope: !9)
!27 = !DILocation(line: 11, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 9)
!29 = !DILocation(line: 11, column: 11, scope: !28)
!30 = !DILocation(line: 11, column: 9, scope: !9)
!31 = !DILocalVariable(name: "b", scope: !32, file: !10, line: 12, type: !13)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 11, column: 17)
!33 = !DILocation(line: 12, column: 13, scope: !32)
!34 = !DILocation(line: 12, column: 17, scope: !32)
!35 = !DILocalVariable(name: "i", scope: !32, file: !10, line: 13, type: !13)
!36 = !DILocation(line: 13, column: 13, scope: !32)
!37 = !DILocation(line: 14, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !10, line: 14, column: 9)
!39 = !DILocation(line: 14, column: 14, scope: !38)
!40 = !DILocation(line: 14, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !10, line: 14, column: 9)
!42 = !DILocation(line: 14, column: 23, scope: !41)
!43 = !DILocation(line: 14, column: 9, scope: !38)
!44 = !DILocation(line: 15, column: 14, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !10, line: 14, column: 33)
!46 = !DILocation(line: 16, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !45, file: !10, line: 16, column: 16)
!48 = !DILocation(line: 16, column: 18, scope: !47)
!49 = !DILocation(line: 16, column: 16, scope: !45)
!50 = !DILocation(line: 17, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !10, line: 16, column: 24)
!52 = !DILocation(line: 19, column: 9, scope: !45)
!53 = !DILocation(line: 14, column: 29, scope: !41)
!54 = !DILocation(line: 14, column: 9, scope: !41)
!55 = distinct !{!55, !43, !56, !57}
!56 = !DILocation(line: 19, column: 9, scope: !38)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 20, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !32, file: !10, line: 20, column: 13)
!60 = !DILocation(line: 20, column: 15, scope: !59)
!61 = !DILocation(line: 20, column: 19, scope: !59)
!62 = !DILocation(line: 20, column: 22, scope: !59)
!63 = !DILocation(line: 20, column: 24, scope: !59)
!64 = !DILocation(line: 20, column: 29, scope: !59)
!65 = !DILocation(line: 20, column: 32, scope: !59)
!66 = !DILocation(line: 20, column: 34, scope: !59)
!67 = !DILocation(line: 20, column: 38, scope: !59)
!68 = !DILocation(line: 20, column: 13, scope: !32)
!69 = !DILocation(line: 22, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !10, line: 22, column: 7)
!71 = distinct !DILexicalBlock(scope: !59, file: !10, line: 20, column: 44)
!72 = !DILocation(line: 22, column: 9, scope: !70)
!73 = !DILocation(line: 22, column: 7, scope: !71)
!74 = !DILocation(line: 23, column: 12, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !10, line: 22, column: 14)
!76 = !DILocation(line: 23, column: 5, scope: !75)
!77 = !DILocation(line: 23, column: 15, scope: !75)
!78 = !DILocation(line: 24, column: 4, scope: !75)
!79 = !DILocation(line: 26, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !10, line: 25, column: 9)
!81 = !DILocation(line: 26, column: 16, scope: !80)
!82 = !DILocation(line: 28, column: 9, scope: !71)
!83 = !DILocation(line: 29, column: 5, scope: !32)
!84 = !DILocation(line: 31, column: 10, scope: !85)
!85 = distinct !DILexicalBlock(scope: !28, file: !10, line: 30, column: 7)
!86 = !DILocation(line: 31, column: 3, scope: !85)
!87 = !DILocation(line: 31, column: 13, scope: !85)
!88 = !DILocation(line: 33, column: 1, scope: !9)
