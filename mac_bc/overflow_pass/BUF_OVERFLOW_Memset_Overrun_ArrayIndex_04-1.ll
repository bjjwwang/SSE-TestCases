; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %a, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %a, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %b, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %b, align 4, !dbg !23
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !24
  call void @srand(i32 noundef %call), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %c, metadata !26, metadata !DIExpression()), !dbg !27
  %call1 = call i32 @rand(), !dbg !28
  %rem = srem i32 %call1, 11, !dbg !29
  store i32 %rem, i32* %c, align 4, !dbg !27
  br label %LOOP, !dbg !30

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !31), !dbg !32
  %0 = load i32, i32* %a, align 4, !dbg !33
  %1 = load i32, i32* %c, align 4, !dbg !35
  %cmp = icmp slt i32 %0, %1, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !38
  %inc = add nsw i32 %2, 1, !dbg !38
  store i32 %inc, i32* %a, align 4, !dbg !38
  %3 = load i32, i32* %b, align 4, !dbg !40
  %add = add nsw i32 %3, 2, !dbg !41
  store i32 %add, i32* %b, align 4, !dbg !42
  br label %LOOP, !dbg !43

if.end:                                           ; preds = %LOOP
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 0, !dbg !44
  %4 = bitcast i32* %arraydecay to i8*, !dbg !44
  %5 = load i32, i32* %a, align 4, !dbg !44
  %conv = sext i32 %5 to i64, !dbg !44
  %call2 = call i8* @__memset_chk(i8* noundef %4, i32 noundef 97, i64 noundef %conv, i64 noundef 40) #4, !dbg !44
  %arraydecay3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 0, !dbg !45
  %6 = bitcast i32* %arraydecay3 to i8*, !dbg !45
  %7 = load i32, i32* %b, align 4, !dbg !45
  %conv4 = sext i32 %7 to i64, !dbg !45
  %call5 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 97, i64 noundef %conv4, i64 noundef 40) #4, !dbg !45
  %8 = load i32, i32* %retval, align 4, !dbg !46
  ret i32 %8, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!21 = !DILocation(line: 9, column: 6, scope: !9)
!22 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocation(line: 11, column: 11, scope: !9)
!25 = !DILocation(line: 11, column: 5, scope: !9)
!26 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 12, type: !13)
!27 = !DILocation(line: 12, column: 9, scope: !9)
!28 = !DILocation(line: 12, column: 13, scope: !9)
!29 = !DILocation(line: 12, column: 20, scope: !9)
!30 = !DILocation(line: 12, column: 5, scope: !9)
!31 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 14)
!32 = !DILocation(line: 14, column: 5, scope: !9)
!33 = !DILocation(line: 15, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 8)
!35 = !DILocation(line: 15, column: 12, scope: !34)
!36 = !DILocation(line: 15, column: 10, scope: !34)
!37 = !DILocation(line: 15, column: 8, scope: !9)
!38 = !DILocation(line: 16, column: 10, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 15, column: 15)
!40 = !DILocation(line: 17, column: 13, scope: !39)
!41 = !DILocation(line: 17, column: 15, scope: !39)
!42 = !DILocation(line: 17, column: 11, scope: !39)
!43 = !DILocation(line: 18, column: 9, scope: !39)
!44 = !DILocation(line: 22, column: 2, scope: !9)
!45 = !DILocation(line: 23, column: 2, scope: !9)
!46 = !DILocation(line: 24, column: 1, scope: !9)
