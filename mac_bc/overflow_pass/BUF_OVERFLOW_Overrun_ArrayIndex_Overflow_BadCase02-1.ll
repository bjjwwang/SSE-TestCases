; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @main() #0 !dbg !13 {
entry:
  %n = alloca i32, align 4
  %ret = alloca i32, align 4
  %p = alloca i8*, align 8
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %n), !dbg !23
  store i32 %call, i32* %ret, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i8** %p, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32, i32* %n, align 4, !dbg !26
  %conv = sext i32 %0 to i64, !dbg !26
  %1 = alloca i8, i64 %conv, align 16, !dbg !26
  store i8* %1, i8** %p, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %y, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = load i32, i32* %n, align 4, !dbg !29
  store i32 %2, i32* %y, align 4, !dbg !28
  %3 = load i8*, i8** %p, align 8, !dbg !30
  %cmp = icmp eq i8* %3, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  br label %return, !dbg !34

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %p, align 8, !dbg !36
  %5 = load i32, i32* %y, align 4, !dbg !37
  %idxprom = sext i32 %5 to i64, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !36
  store i8 97, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %p, align 8, !dbg !39
  call void @free(i8* noundef %6), !dbg !40
  br label %return, !dbg !41

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @scanf(i8* noundef, ...) #2

declare void @free(i8* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "n", scope: !13, file: !14, line: 30, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 9, scope: !13)
!21 = !DILocalVariable(name: "ret", scope: !13, file: !14, line: 31, type: !19)
!22 = !DILocation(line: 31, column: 9, scope: !13)
!23 = !DILocation(line: 31, column: 15, scope: !13)
!24 = !DILocalVariable(name: "p", scope: !13, file: !14, line: 32, type: !3)
!25 = !DILocation(line: 32, column: 11, scope: !13)
!26 = !DILocation(line: 32, column: 23, scope: !13)
!27 = !DILocalVariable(name: "y", scope: !13, file: !14, line: 33, type: !19)
!28 = !DILocation(line: 33, column: 9, scope: !13)
!29 = !DILocation(line: 33, column: 13, scope: !13)
!30 = !DILocation(line: 34, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 9)
!32 = !DILocation(line: 34, column: 11, scope: !31)
!33 = !DILocation(line: 34, column: 9, scope: !13)
!34 = !DILocation(line: 35, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !14, line: 34, column: 20)
!36 = !DILocation(line: 38, column: 5, scope: !13)
!37 = !DILocation(line: 38, column: 7, scope: !13)
!38 = !DILocation(line: 38, column: 10, scope: !13)
!39 = !DILocation(line: 39, column: 10, scope: !13)
!40 = !DILocation(line: 39, column: 5, scope: !13)
!41 = !DILocation(line: 40, column: 1, scope: !13)
