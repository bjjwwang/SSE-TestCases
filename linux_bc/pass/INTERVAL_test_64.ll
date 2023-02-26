; ModuleID = 'linux_bc/pass/INTERVAL_test_64.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_64.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @increment(i32* %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32*, i32** %a.addr, align 8, !dbg !17
  %1 = load i32, i32* %0, align 4, !dbg !18
  %add = add nsw i32 %1, 1, !dbg !19
  %2 = load i32*, i32** %a.addr, align 8, !dbg !20
  store i32 %add, i32* %2, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @recursive(i32 %a) #0 !dbg !23 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %a.addr, align 4, !dbg !28
  %dec = add nsw i32 %0, -1, !dbg !28
  store i32 %dec, i32* %a.addr, align 4, !dbg !28
  %1 = load i32, i32* %a.addr, align 4, !dbg !29
  %tobool = icmp ne i32 %1, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !32
  %call = call i32 @recursive(i32 %2), !dbg !34
  store i32 %call, i32* %a.addr, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !37
  ret i32 %3, !dbg !38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !42, metadata !DIExpression()), !dbg !43
  br label %LOOP, !dbg !44

LOOP:                                             ; preds = %if.then5, %entry
  call void @llvm.dbg.label(metadata !45), !dbg !46
  %0 = load i32, i32* %a, align 4, !dbg !47
  %cmp = icmp sgt i32 %0, 5, !dbg !49
  br i1 %cmp, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %LOOP
  %1 = load i32, i32* %a, align 4, !dbg !51
  %dec = add nsw i32 %1, -1, !dbg !51
  store i32 %dec, i32* %a, align 4, !dbg !51
  br label %if.end3, !dbg !53

if.else:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !54
  %cmp1 = icmp slt i32 %2, 5, !dbg !56
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !57

if.then2:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !58
  %inc = add nsw i32 %3, 1, !dbg !58
  store i32 %inc, i32* %a, align 4, !dbg !58
  br label %if.end, !dbg !60

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i32, i32* %a, align 4, !dbg !61
  %cmp4 = icmp ne i32 %4, 5, !dbg !63
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !64

if.then5:                                         ; preds = %if.end3
  br label %LOOP, !dbg !65

if.else6:                                         ; preds = %if.end3
  %5 = load i32, i32* %a, align 4, !dbg !67
  %call = call i32 @recursive(i32 %5), !dbg !69
  store i32 %call, i32* %a, align 4, !dbg !70
  br label %if.end7

if.end7:                                          ; preds = %if.else6
  br label %while.body, !dbg !71

while.body:                                       ; preds = %if.end10, %if.end7
  call void @increment(i32* %a), !dbg !72
  %6 = load i32, i32* %a, align 4, !dbg !74
  %cmp8 = icmp eq i32 %6, 10, !dbg !76
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !77

if.then9:                                         ; preds = %while.body
  call void @exit(i32 0) #3, !dbg !78
  unreachable, !dbg !78

if.end10:                                         ; preds = %while.body
  br label %while.body, !dbg !71, !llvm.loop !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_64.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "increment", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_64.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 9, type: !13)
!16 = !DILocation(line: 9, column: 21, scope: !9)
!17 = !DILocation(line: 10, column: 8, scope: !9)
!18 = !DILocation(line: 10, column: 7, scope: !9)
!19 = !DILocation(line: 10, column: 10, scope: !9)
!20 = !DILocation(line: 10, column: 3, scope: !9)
!21 = !DILocation(line: 10, column: 5, scope: !9)
!22 = !DILocation(line: 11, column: 1, scope: !9)
!23 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 13, type: !24, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!14, !14}
!26 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !10, line: 13, type: !14)
!27 = !DILocation(line: 13, column: 19, scope: !23)
!28 = !DILocation(line: 14, column: 3, scope: !23)
!29 = !DILocation(line: 15, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !10, line: 15, column: 5)
!31 = !DILocation(line: 15, column: 5, scope: !23)
!32 = !DILocation(line: 16, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !10, line: 15, column: 8)
!34 = !DILocation(line: 16, column: 7, scope: !33)
!35 = !DILocation(line: 16, column: 5, scope: !33)
!36 = !DILocation(line: 17, column: 2, scope: !33)
!37 = !DILocation(line: 18, column: 9, scope: !23)
!38 = !DILocation(line: 18, column: 2, scope: !23)
!39 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 21, type: !40, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!14}
!42 = !DILocalVariable(name: "a", scope: !39, file: !10, line: 22, type: !14)
!43 = !DILocation(line: 22, column: 6, scope: !39)
!44 = !DILocation(line: 22, column: 2, scope: !39)
!45 = !DILabel(scope: !39, name: "LOOP", file: !10, line: 23)
!46 = !DILocation(line: 23, column: 2, scope: !39)
!47 = !DILocation(line: 24, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !10, line: 24, column: 5)
!49 = !DILocation(line: 24, column: 7, scope: !48)
!50 = !DILocation(line: 24, column: 5, scope: !39)
!51 = !DILocation(line: 25, column: 4, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !10, line: 24, column: 12)
!53 = !DILocation(line: 26, column: 2, scope: !52)
!54 = !DILocation(line: 27, column: 10, scope: !55)
!55 = distinct !DILexicalBlock(scope: !48, file: !10, line: 27, column: 10)
!56 = !DILocation(line: 27, column: 12, scope: !55)
!57 = !DILocation(line: 27, column: 10, scope: !48)
!58 = !DILocation(line: 28, column: 4, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !10, line: 27, column: 17)
!60 = !DILocation(line: 29, column: 2, scope: !59)
!61 = !DILocation(line: 31, column: 5, scope: !62)
!62 = distinct !DILexicalBlock(scope: !39, file: !10, line: 31, column: 5)
!63 = !DILocation(line: 31, column: 7, scope: !62)
!64 = !DILocation(line: 31, column: 5, scope: !39)
!65 = !DILocation(line: 32, column: 3, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !10, line: 31, column: 13)
!67 = !DILocation(line: 35, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !10, line: 34, column: 7)
!69 = !DILocation(line: 35, column: 7, scope: !68)
!70 = !DILocation(line: 35, column: 5, scope: !68)
!71 = !DILocation(line: 37, column: 2, scope: !39)
!72 = !DILocation(line: 38, column: 3, scope: !73)
!73 = distinct !DILexicalBlock(scope: !39, file: !10, line: 37, column: 14)
!74 = !DILocation(line: 39, column: 6, scope: !75)
!75 = distinct !DILexicalBlock(scope: !73, file: !10, line: 39, column: 6)
!76 = !DILocation(line: 39, column: 8, scope: !75)
!77 = !DILocation(line: 39, column: 6, scope: !73)
!78 = !DILocation(line: 40, column: 4, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 39, column: 15)
!80 = distinct !{!80, !71, !81}
!81 = !DILocation(line: 42, column: 2, scope: !39)
