; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 51, !dbg !25
  %sub = sub nsw i32 %rem, 25, !dbg !26
  store i32 %sub, i32* %a, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %b, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %a, align 4, !dbg !29
  store i32 %0, i32* %b, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %1, 3, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %b, align 4, !dbg !38
  %3 = load i32, i32* %a, align 4, !dbg !40
  %mul = mul nsw i32 %2, %3, !dbg !41
  store i32 %mul, i32* %b, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %4, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %b, align 4, !dbg !49
  %cmp2 = icmp sge i32 %5, 0, !dbg !51
  br i1 %cmp2, label %if.then, label %if.else, !dbg !52

if.then:                                          ; preds = %for.end
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 2, !dbg !53
  store i32 1, i32* %arrayidx, align 4, !dbg !55
  br label %if.end, !dbg !56

if.else:                                          ; preds = %for.end
  %arrayidx3 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 2, !dbg !57
  store i32 1, i32* %arrayidx3, align 4, !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %6, !dbg !60
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 2)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocation(line: 9, column: 11, scope: !9)
!21 = !DILocation(line: 9, column: 5, scope: !9)
!22 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocation(line: 10, column: 14, scope: !9)
!25 = !DILocation(line: 10, column: 21, scope: !9)
!26 = !DILocation(line: 10, column: 27, scope: !9)
!27 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!28 = !DILocation(line: 12, column: 9, scope: !9)
!29 = !DILocation(line: 12, column: 13, scope: !9)
!30 = !DILocalVariable(name: "i", scope: !31, file: !10, line: 13, type: !13)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 5)
!32 = !DILocation(line: 13, column: 13, scope: !31)
!33 = !DILocation(line: 13, column: 9, scope: !31)
!34 = !DILocation(line: 13, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 13, column: 5)
!36 = !DILocation(line: 13, column: 22, scope: !35)
!37 = !DILocation(line: 13, column: 5, scope: !31)
!38 = !DILocation(line: 14, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !10, line: 13, column: 32)
!40 = !DILocation(line: 14, column: 17, scope: !39)
!41 = !DILocation(line: 14, column: 15, scope: !39)
!42 = !DILocation(line: 14, column: 11, scope: !39)
!43 = !DILocation(line: 15, column: 5, scope: !39)
!44 = !DILocation(line: 13, column: 28, scope: !35)
!45 = !DILocation(line: 13, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 15, column: 5, scope: !31)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 17, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !9, file: !10, line: 17, column: 5)
!51 = !DILocation(line: 17, column: 7, scope: !50)
!52 = !DILocation(line: 17, column: 5, scope: !9)
!53 = !DILocation(line: 18, column: 3, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !10, line: 17, column: 13)
!55 = !DILocation(line: 18, column: 13, scope: !54)
!56 = !DILocation(line: 19, column: 2, scope: !54)
!57 = !DILocation(line: 21, column: 3, scope: !58)
!58 = distinct !DILexicalBlock(scope: !50, file: !10, line: 20, column: 10)
!59 = !DILocation(line: 21, column: 13, scope: !58)
!60 = !DILocation(line: 23, column: 1, scope: !9)
