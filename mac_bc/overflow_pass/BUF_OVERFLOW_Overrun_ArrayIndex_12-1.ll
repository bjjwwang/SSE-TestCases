; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !15, metadata !DIExpression()), !dbg !17
  %call = call i8* @malloc(i64 noundef 28) #4, !dbg !18
  %0 = bitcast i8* %call to i32*, !dbg !18
  store i32* %0, i32** %buffer, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %a, metadata !19, metadata !DIExpression()), !dbg !20
  %call1 = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %a), !dbg !21
  %1 = load i32, i32* %a, align 4, !dbg !22
  %cmp = icmp sgt i32 %1, 5, !dbg !24
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !25

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !26
  %cmp2 = icmp slt i32 %2, 7, !dbg !27
  br i1 %cmp2, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32*, i32** %buffer, align 8, !dbg !29
  %4 = load i32, i32* %a, align 4, !dbg !31
  %idxprom = sext i32 %4 to i64, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !29
  store i32 1, i32* %arrayidx, align 4, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load i32, i32* %a, align 4, !dbg !34
  %cmp3 = icmp sgt i32 %5, 5, !dbg !36
  br i1 %cmp3, label %land.lhs.true4, label %if.end9, !dbg !37

land.lhs.true4:                                   ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !38
  %cmp5 = icmp slt i32 %6, 8, !dbg !39
  br i1 %cmp5, label %if.then6, label %if.end9, !dbg !40

if.then6:                                         ; preds = %land.lhs.true4
  %7 = load i32*, i32** %buffer, align 8, !dbg !41
  %8 = load i32, i32* %a, align 4, !dbg !43
  %idxprom7 = sext i32 %8 to i64, !dbg !41
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %idxprom7, !dbg !41
  store i32 1, i32* %arrayidx8, align 4, !dbg !44
  br label %if.end9, !dbg !45

if.end9:                                          ; preds = %if.then6, %land.lhs.true4, %if.end
  %9 = load i32, i32* %retval, align 4, !dbg !46
  ret i32 %9, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare i32 @scanf(i8* noundef, ...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!17 = !DILocation(line: 8, column: 7, scope: !9)
!18 = !DILocation(line: 8, column: 16, scope: !9)
!19 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!20 = !DILocation(line: 9, column: 6, scope: !9)
!21 = !DILocation(line: 10, column: 2, scope: !9)
!22 = !DILocation(line: 11, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 8)
!24 = !DILocation(line: 11, column: 10, scope: !23)
!25 = !DILocation(line: 11, column: 14, scope: !23)
!26 = !DILocation(line: 11, column: 17, scope: !23)
!27 = !DILocation(line: 11, column: 19, scope: !23)
!28 = !DILocation(line: 11, column: 8, scope: !9)
!29 = !DILocation(line: 12, column: 3, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !10, line: 11, column: 24)
!31 = !DILocation(line: 12, column: 10, scope: !30)
!32 = !DILocation(line: 12, column: 13, scope: !30)
!33 = !DILocation(line: 13, column: 5, scope: !30)
!34 = !DILocation(line: 14, column: 5, scope: !35)
!35 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 5)
!36 = !DILocation(line: 14, column: 7, scope: !35)
!37 = !DILocation(line: 14, column: 11, scope: !35)
!38 = !DILocation(line: 14, column: 14, scope: !35)
!39 = !DILocation(line: 14, column: 16, scope: !35)
!40 = !DILocation(line: 14, column: 5, scope: !9)
!41 = !DILocation(line: 15, column: 3, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !10, line: 14, column: 21)
!43 = !DILocation(line: 15, column: 10, scope: !42)
!44 = !DILocation(line: 15, column: 13, scope: !42)
!45 = !DILocation(line: 16, column: 2, scope: !42)
!46 = !DILocation(line: 17, column: 1, scope: !9)
