; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @increment(i32* noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32*, i32** %a.addr, align 8, !dbg !18
  %1 = load i32, i32* %0, align 4, !dbg !19
  %add = add nsw i32 %1, 1, !dbg !20
  %2 = load i32*, i32** %a.addr, align 8, !dbg !21
  store i32 %add, i32* %2, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @recursive(i32 noundef %a) #0 !dbg !24 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %a.addr, align 4, !dbg !29
  %dec = add nsw i32 %0, -1, !dbg !29
  store i32 %dec, i32* %a.addr, align 4, !dbg !29
  %1 = load i32, i32* %a.addr, align 4, !dbg !30
  %tobool = icmp ne i32 %1, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !33
  %call = call i32 @recursive(i32 noundef %2), !dbg !35
  store i32 %call, i32* %a.addr, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !38
  ret i32 %3, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !47
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !48
  call void @srand(i32 noundef %call), !dbg !49
  call void @llvm.dbg.declare(metadata i32* %a, metadata !50, metadata !DIExpression()), !dbg !51
  %call1 = call i32 @rand(), !dbg !52
  %rem = srem i32 %call1, 11, !dbg !53
  store i32 %rem, i32* %a, align 4, !dbg !51
  br label %LOOP, !dbg !54

LOOP:                                             ; preds = %if.then6, %entry
  call void @llvm.dbg.label(metadata !55), !dbg !56
  %0 = load i32, i32* %a, align 4, !dbg !57
  %cmp = icmp sgt i32 %0, 5, !dbg !59
  br i1 %cmp, label %if.then, label %if.else, !dbg !60

if.then:                                          ; preds = %LOOP
  %1 = load i32, i32* %a, align 4, !dbg !61
  %dec = add nsw i32 %1, -1, !dbg !61
  store i32 %dec, i32* %a, align 4, !dbg !61
  br label %if.end4, !dbg !63

if.else:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !64
  %cmp2 = icmp slt i32 %2, 5, !dbg !66
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !67

if.then3:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !68
  %inc = add nsw i32 %3, 1, !dbg !68
  store i32 %inc, i32* %a, align 4, !dbg !68
  br label %if.end, !dbg !70

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %4 = load i32, i32* %a, align 4, !dbg !71
  %cmp5 = icmp ne i32 %4, 5, !dbg !73
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !74

if.then6:                                         ; preds = %if.end4
  br label %LOOP, !dbg !75

if.else7:                                         ; preds = %if.end4
  %5 = load i32, i32* %a, align 4, !dbg !77
  %call8 = call i32 @recursive(i32 noundef %5), !dbg !79
  store i32 %call8, i32* %a, align 4, !dbg !80
  %6 = load i32, i32* %a, align 4, !dbg !81
  %idxprom = sext i32 %6 to i64, !dbg !82
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !82
  store i32 1, i32* %arrayidx, align 4, !dbg !83
  br label %if.end9

if.end9:                                          ; preds = %if.else7
  br label %while.body, !dbg !84

while.body:                                       ; preds = %if.end14, %if.end9
  call void @increment(i32* noundef %a), !dbg !85
  %7 = load i32, i32* %a, align 4, !dbg !87
  %cmp10 = icmp eq i32 %7, 10, !dbg !89
  br i1 %cmp10, label %if.then11, label %if.end14, !dbg !90

if.then11:                                        ; preds = %while.body
  %8 = load i32, i32* %a, align 4, !dbg !91
  %idxprom12 = sext i32 %8 to i64, !dbg !93
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !93
  store i32 1, i32* %arrayidx13, align 4, !dbg !94
  call void @exit(i32 noundef 0) #4, !dbg !95
  unreachable, !dbg !95

if.end14:                                         ; preds = %while.body
  br label %while.body, !dbg !84, !llvm.loop !96
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "increment", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 21, scope: !9)
!18 = !DILocation(line: 8, column: 8, scope: !9)
!19 = !DILocation(line: 8, column: 7, scope: !9)
!20 = !DILocation(line: 8, column: 10, scope: !9)
!21 = !DILocation(line: 8, column: 3, scope: !9)
!22 = !DILocation(line: 8, column: 5, scope: !9)
!23 = !DILocation(line: 9, column: 1, scope: !9)
!24 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 11, type: !25, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!25 = !DISubroutineType(types: !26)
!26 = !{!14, !14}
!27 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !10, line: 11, type: !14)
!28 = !DILocation(line: 11, column: 19, scope: !24)
!29 = !DILocation(line: 12, column: 3, scope: !24)
!30 = !DILocation(line: 13, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !10, line: 13, column: 5)
!32 = !DILocation(line: 13, column: 5, scope: !24)
!33 = !DILocation(line: 14, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !10, line: 13, column: 8)
!35 = !DILocation(line: 14, column: 7, scope: !34)
!36 = !DILocation(line: 14, column: 5, scope: !34)
!37 = !DILocation(line: 15, column: 2, scope: !34)
!38 = !DILocation(line: 16, column: 9, scope: !24)
!39 = !DILocation(line: 16, column: 2, scope: !24)
!40 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 19, type: !41, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!41 = !DISubroutineType(types: !42)
!42 = !{!14}
!43 = !DILocalVariable(name: "buffer", scope: !40, file: !10, line: 20, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 20, column: 6, scope: !40)
!48 = !DILocation(line: 21, column: 8, scope: !40)
!49 = !DILocation(line: 21, column: 2, scope: !40)
!50 = !DILocalVariable(name: "a", scope: !40, file: !10, line: 22, type: !14)
!51 = !DILocation(line: 22, column: 9, scope: !40)
!52 = !DILocation(line: 22, column: 13, scope: !40)
!53 = !DILocation(line: 22, column: 20, scope: !40)
!54 = !DILocation(line: 22, column: 5, scope: !40)
!55 = !DILabel(scope: !40, name: "LOOP", file: !10, line: 24)
!56 = !DILocation(line: 24, column: 2, scope: !40)
!57 = !DILocation(line: 25, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !40, file: !10, line: 25, column: 5)
!59 = !DILocation(line: 25, column: 7, scope: !58)
!60 = !DILocation(line: 25, column: 5, scope: !40)
!61 = !DILocation(line: 26, column: 4, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !10, line: 25, column: 12)
!63 = !DILocation(line: 27, column: 2, scope: !62)
!64 = !DILocation(line: 28, column: 10, scope: !65)
!65 = distinct !DILexicalBlock(scope: !58, file: !10, line: 28, column: 10)
!66 = !DILocation(line: 28, column: 12, scope: !65)
!67 = !DILocation(line: 28, column: 10, scope: !58)
!68 = !DILocation(line: 29, column: 4, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !10, line: 28, column: 17)
!70 = !DILocation(line: 30, column: 2, scope: !69)
!71 = !DILocation(line: 32, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !40, file: !10, line: 32, column: 5)
!73 = !DILocation(line: 32, column: 7, scope: !72)
!74 = !DILocation(line: 32, column: 5, scope: !40)
!75 = !DILocation(line: 33, column: 3, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 32, column: 13)
!77 = !DILocation(line: 37, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !10, line: 35, column: 7)
!79 = !DILocation(line: 37, column: 7, scope: !78)
!80 = !DILocation(line: 37, column: 5, scope: !78)
!81 = !DILocation(line: 39, column: 10, scope: !78)
!82 = !DILocation(line: 39, column: 3, scope: !78)
!83 = !DILocation(line: 39, column: 13, scope: !78)
!84 = !DILocation(line: 41, column: 2, scope: !40)
!85 = !DILocation(line: 42, column: 3, scope: !86)
!86 = distinct !DILexicalBlock(scope: !40, file: !10, line: 41, column: 14)
!87 = !DILocation(line: 44, column: 6, scope: !88)
!88 = distinct !DILexicalBlock(scope: !86, file: !10, line: 44, column: 6)
!89 = !DILocation(line: 44, column: 8, scope: !88)
!90 = !DILocation(line: 44, column: 6, scope: !86)
!91 = !DILocation(line: 45, column: 11, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !10, line: 44, column: 15)
!93 = !DILocation(line: 45, column: 4, scope: !92)
!94 = !DILocation(line: 45, column: 14, scope: !92)
!95 = !DILocation(line: 46, column: 4, scope: !92)
!96 = distinct !{!96, !84, !97}
!97 = !DILocation(line: 48, column: 2, scope: !40)
