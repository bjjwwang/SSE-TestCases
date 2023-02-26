; ModuleID = 'mac_bc/overflow_unpass/BUF_OVERFLOW_test_23.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_23.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%3s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [4 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i8]* %buffer, metadata !15, metadata !DIExpression()), !dbg !20
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %buffer, i64 0, i64 0, !dbg !21
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay), !dbg !22
  %arraydecay1 = getelementptr inbounds [4 x i8], [4 x i8]* %buffer, i64 0, i64 0, !dbg !23
  %call2 = call i32 @strcmp(i8* noundef %arraydecay1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !25
  %tobool = icmp ne i32 %call2, 0, !dbg !25
  br i1 %tobool, label %if.end, label %if.then, !dbg !26

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %buffer, i64 0, i64 4, !dbg !27
  store i8 97, i8* %arrayidx, align 1, !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %0 = load i32, i32* %retval, align 4, !dbg !31
  ret i32 %0, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @scanf(i8* noundef, ...) #2

declare i32 @strcmp(i8* noundef, i8* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_23.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_23.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 4)
!20 = !DILocation(line: 8, column: 10, scope: !9)
!21 = !DILocation(line: 9, column: 18, scope: !9)
!22 = !DILocation(line: 9, column: 5, scope: !9)
!23 = !DILocation(line: 10, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!25 = !DILocation(line: 10, column: 9, scope: !24)
!26 = !DILocation(line: 10, column: 8, scope: !9)
!27 = !DILocation(line: 11, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 10, column: 32)
!29 = !DILocation(line: 11, column: 19, scope: !28)
!30 = !DILocation(line: 12, column: 5, scope: !28)
!31 = !DILocation(line: 13, column: 1, scope: !9)
