; ModuleID = 'mac_bc/pass/INTERVAL_test_27.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_27.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %ch = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !15
  call void @srand(i32 noundef %call), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !17, metadata !DIExpression()), !dbg !18
  %call1 = call i32 @rand(), !dbg !19
  %rem = srem i32 %call1, 128, !dbg !20
  store i32 %rem, i32* %randomNumber, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i8* %ch, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %randomNumber, align 4, !dbg !24
  %conv = trunc i32 %0 to i8, !dbg !24
  store i8 %conv, i8* %ch, align 1, !dbg !23
  %1 = load i8, i8* %ch, align 1, !dbg !25
  %conv2 = sext i8 %1 to i32, !dbg !25
  %call3 = call i32 @isdigit(i32 noundef %conv2) #4, !dbg !27
  %tobool = icmp ne i32 %call3, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %randomNumber, align 4, !dbg !29
  %cmp = icmp sge i32 %2, 48, !dbg !31
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !32

land.rhs:                                         ; preds = %if.then
  %3 = load i32, i32* %randomNumber, align 4, !dbg !33
  %cmp5 = icmp sle i32 %3, 57, !dbg !34
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %4 = phi i1 [ false, %if.then ], [ %cmp5, %land.rhs ], !dbg !35
  call void @svf_assert(i1 noundef zeroext %4), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %randomNumber, align 4, !dbg !38
  %cmp7 = icmp slt i32 %5, 48, !dbg !40
  br i1 %cmp7, label %lor.end, label %lor.rhs, !dbg !41

lor.rhs:                                          ; preds = %if.else
  %6 = load i32, i32* %randomNumber, align 4, !dbg !42
  %cmp9 = icmp sgt i32 %6, 57, !dbg !43
  br label %lor.end, !dbg !41

lor.end:                                          ; preds = %lor.rhs, %if.else
  %7 = phi i1 [ true, %if.else ], [ %cmp9, %lor.rhs ]
  call void @svf_assert(i1 noundef zeroext %7), !dbg !44
  br label %if.end

if.end:                                           ; preds = %lor.end, %land.end
  %8 = load i32, i32* %retval, align 4, !dbg !45
  ret i32 %8, !dbg !45
}

declare void @srand(i32 noundef) #1

declare i32 @time(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand() #1

; Function Attrs: nounwind readonly willreturn
declare i32 @isdigit(i32 noundef) #3

declare void @svf_assert(i1 noundef zeroext) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_27.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_27.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocation(line: 8, column: 11, scope: !9)
!16 = !DILocation(line: 8, column: 5, scope: !9)
!17 = !DILocalVariable(name: "randomNumber", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 21, scope: !9)
!20 = !DILocation(line: 9, column: 28, scope: !9)
!21 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 10, type: !22)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 10, column: 10, scope: !9)
!24 = !DILocation(line: 10, column: 15, scope: !9)
!25 = !DILocation(line: 11, column: 17, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 9)
!27 = !DILocation(line: 11, column: 9, scope: !26)
!28 = !DILocation(line: 11, column: 9, scope: !9)
!29 = !DILocation(line: 12, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 11, column: 22)
!31 = !DILocation(line: 12, column: 27, scope: !30)
!32 = !DILocation(line: 12, column: 33, scope: !30)
!33 = !DILocation(line: 12, column: 36, scope: !30)
!34 = !DILocation(line: 12, column: 49, scope: !30)
!35 = !DILocation(line: 0, scope: !30)
!36 = !DILocation(line: 12, column: 3, scope: !30)
!37 = !DILocation(line: 13, column: 5, scope: !30)
!38 = !DILocation(line: 15, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !26, file: !10, line: 14, column: 10)
!40 = !DILocation(line: 15, column: 27, scope: !39)
!41 = !DILocation(line: 15, column: 32, scope: !39)
!42 = !DILocation(line: 15, column: 35, scope: !39)
!43 = !DILocation(line: 15, column: 48, scope: !39)
!44 = !DILocation(line: 15, column: 3, scope: !39)
!45 = !DILocation(line: 17, column: 1, scope: !9)
