; ModuleID = 'mac_bc/pass/BUF_OVERFLOW_test_47.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BUF_OVERFLOW_test_47.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [58 x i32], align 16
  %randomNumber = alloca i32, align 4
  %ch = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [58 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 128, !dbg !25
  store i32 %rem, i32* %randomNumber, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i8* %ch, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %randomNumber, align 4, !dbg !29
  %conv = trunc i32 %0 to i8, !dbg !29
  store i8 %conv, i8* %ch, align 1, !dbg !28
  %1 = load i8, i8* %ch, align 1, !dbg !30
  %conv2 = sext i8 %1 to i32, !dbg !30
  %call3 = call i32 @isdigit(i32 noundef %conv2) #4, !dbg !32
  %tobool = icmp ne i32 %call3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %randomNumber, align 4, !dbg !34
  %idxprom = sext i32 %2 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [58 x i32], [58 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !36
  store i32 1, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %randomNumber, align 4, !dbg !39
  %idxprom4 = sext i32 %3 to i64, !dbg !41
  %arrayidx5 = getelementptr inbounds [58 x i32], [58 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !41
  store i32 1, i32* %arrayidx5, align 4, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %4, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nounwind readonly willreturn
declare i32 @isdigit(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BUF_OVERFLOW_test_47.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BUF_OVERFLOW_test_47.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 9, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1856, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 58)
!19 = !DILocation(line: 9, column: 6, scope: !9)
!20 = !DILocation(line: 10, column: 11, scope: !9)
!21 = !DILocation(line: 10, column: 5, scope: !9)
!22 = !DILocalVariable(name: "randomNumber", scope: !9, file: !10, line: 11, type: !13)
!23 = !DILocation(line: 11, column: 6, scope: !9)
!24 = !DILocation(line: 11, column: 21, scope: !9)
!25 = !DILocation(line: 11, column: 28, scope: !9)
!26 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 12, type: !27)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !DILocation(line: 12, column: 10, scope: !9)
!29 = !DILocation(line: 12, column: 15, scope: !9)
!30 = !DILocation(line: 13, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 9)
!32 = !DILocation(line: 13, column: 9, scope: !31)
!33 = !DILocation(line: 13, column: 9, scope: !9)
!34 = !DILocation(line: 15, column: 10, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 13, column: 22)
!36 = !DILocation(line: 15, column: 3, scope: !35)
!37 = !DILocation(line: 15, column: 24, scope: !35)
!38 = !DILocation(line: 16, column: 5, scope: !35)
!39 = !DILocation(line: 19, column: 10, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !10, line: 17, column: 10)
!41 = !DILocation(line: 19, column: 3, scope: !40)
!42 = !DILocation(line: 19, column: 24, scope: !40)
!43 = !DILocation(line: 21, column: 1, scope: !9)
