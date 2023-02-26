; ModuleID = 'mac_bc/pass/INTERVAL_test_64.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_64.c"
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
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !43, metadata !DIExpression()), !dbg !44
  br label %LOOP, !dbg !45

LOOP:                                             ; preds = %if.then5, %entry
  call void @llvm.dbg.label(metadata !46), !dbg !47
  %0 = load i32, i32* %a, align 4, !dbg !48
  %cmp = icmp sgt i32 %0, 5, !dbg !50
  br i1 %cmp, label %if.then, label %if.else, !dbg !51

if.then:                                          ; preds = %LOOP
  %1 = load i32, i32* %a, align 4, !dbg !52
  %dec = add nsw i32 %1, -1, !dbg !52
  store i32 %dec, i32* %a, align 4, !dbg !52
  br label %if.end3, !dbg !54

if.else:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !55
  %cmp1 = icmp slt i32 %2, 5, !dbg !57
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !58

if.then2:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !59
  %inc = add nsw i32 %3, 1, !dbg !59
  store i32 %inc, i32* %a, align 4, !dbg !59
  br label %if.end, !dbg !61

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i32, i32* %a, align 4, !dbg !62
  %cmp4 = icmp ne i32 %4, 5, !dbg !64
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !65

if.then5:                                         ; preds = %if.end3
  br label %LOOP, !dbg !66

if.else6:                                         ; preds = %if.end3
  %5 = load i32, i32* %a, align 4, !dbg !68
  %call = call i32 @recursive(i32 noundef %5), !dbg !70
  store i32 %call, i32* %a, align 4, !dbg !71
  br label %if.end7

if.end7:                                          ; preds = %if.else6
  br label %while.body, !dbg !72

while.body:                                       ; preds = %if.end10, %if.end7
  call void @increment(i32* noundef %a), !dbg !73
  %6 = load i32, i32* %a, align 4, !dbg !75
  %cmp8 = icmp eq i32 %6, 10, !dbg !77
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !78

if.then9:                                         ; preds = %while.body
  call void @exit(i32 noundef 0) #3, !dbg !79
  unreachable, !dbg !79

if.end10:                                         ; preds = %while.body
  br label %while.body, !dbg !72, !llvm.loop !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noreturn
declare void @exit(i32 noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_64.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "increment", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_64.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 21, scope: !9)
!18 = !DILocation(line: 10, column: 8, scope: !9)
!19 = !DILocation(line: 10, column: 7, scope: !9)
!20 = !DILocation(line: 10, column: 10, scope: !9)
!21 = !DILocation(line: 10, column: 3, scope: !9)
!22 = !DILocation(line: 10, column: 5, scope: !9)
!23 = !DILocation(line: 11, column: 1, scope: !9)
!24 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 13, type: !25, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!25 = !DISubroutineType(types: !26)
!26 = !{!14, !14}
!27 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !10, line: 13, type: !14)
!28 = !DILocation(line: 13, column: 19, scope: !24)
!29 = !DILocation(line: 14, column: 3, scope: !24)
!30 = !DILocation(line: 15, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !10, line: 15, column: 5)
!32 = !DILocation(line: 15, column: 5, scope: !24)
!33 = !DILocation(line: 16, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !10, line: 15, column: 8)
!35 = !DILocation(line: 16, column: 7, scope: !34)
!36 = !DILocation(line: 16, column: 5, scope: !34)
!37 = !DILocation(line: 17, column: 2, scope: !34)
!38 = !DILocation(line: 18, column: 9, scope: !24)
!39 = !DILocation(line: 18, column: 2, scope: !24)
!40 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 21, type: !41, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!41 = !DISubroutineType(types: !42)
!42 = !{!14}
!43 = !DILocalVariable(name: "a", scope: !40, file: !10, line: 22, type: !14)
!44 = !DILocation(line: 22, column: 6, scope: !40)
!45 = !DILocation(line: 22, column: 2, scope: !40)
!46 = !DILabel(scope: !40, name: "LOOP", file: !10, line: 23)
!47 = !DILocation(line: 23, column: 2, scope: !40)
!48 = !DILocation(line: 24, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !40, file: !10, line: 24, column: 5)
!50 = !DILocation(line: 24, column: 7, scope: !49)
!51 = !DILocation(line: 24, column: 5, scope: !40)
!52 = !DILocation(line: 25, column: 4, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 24, column: 12)
!54 = !DILocation(line: 26, column: 2, scope: !53)
!55 = !DILocation(line: 27, column: 10, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !10, line: 27, column: 10)
!57 = !DILocation(line: 27, column: 12, scope: !56)
!58 = !DILocation(line: 27, column: 10, scope: !49)
!59 = !DILocation(line: 28, column: 4, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !10, line: 27, column: 17)
!61 = !DILocation(line: 29, column: 2, scope: !60)
!62 = !DILocation(line: 31, column: 5, scope: !63)
!63 = distinct !DILexicalBlock(scope: !40, file: !10, line: 31, column: 5)
!64 = !DILocation(line: 31, column: 7, scope: !63)
!65 = !DILocation(line: 31, column: 5, scope: !40)
!66 = !DILocation(line: 32, column: 3, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !10, line: 31, column: 13)
!68 = !DILocation(line: 35, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !10, line: 34, column: 7)
!70 = !DILocation(line: 35, column: 7, scope: !69)
!71 = !DILocation(line: 35, column: 5, scope: !69)
!72 = !DILocation(line: 37, column: 2, scope: !40)
!73 = !DILocation(line: 38, column: 3, scope: !74)
!74 = distinct !DILexicalBlock(scope: !40, file: !10, line: 37, column: 14)
!75 = !DILocation(line: 39, column: 6, scope: !76)
!76 = distinct !DILexicalBlock(scope: !74, file: !10, line: 39, column: 6)
!77 = !DILocation(line: 39, column: 8, scope: !76)
!78 = !DILocation(line: 39, column: 6, scope: !74)
!79 = !DILocation(line: 40, column: 4, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !10, line: 39, column: 15)
!81 = distinct !{!81, !72, !82}
!82 = !DILocation(line: 42, column: 2, scope: !40)
