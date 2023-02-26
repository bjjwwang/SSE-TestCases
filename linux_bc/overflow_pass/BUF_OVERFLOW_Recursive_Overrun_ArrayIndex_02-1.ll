; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.c"
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
  %buffer = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !42, metadata !DIExpression()), !dbg !46
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !47
  call void @srand(i32 %call) #5, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %a, metadata !49, metadata !DIExpression()), !dbg !50
  %call1 = call i32 @rand() #5, !dbg !51
  %rem = srem i32 %call1, 11, !dbg !52
  store i32 %rem, i32* %a, align 4, !dbg !50
  br label %LOOP, !dbg !53

LOOP:                                             ; preds = %if.then6, %entry
  call void @llvm.dbg.label(metadata !54), !dbg !55
  %0 = load i32, i32* %a, align 4, !dbg !56
  %cmp = icmp sgt i32 %0, 5, !dbg !58
  br i1 %cmp, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %LOOP
  %1 = load i32, i32* %a, align 4, !dbg !60
  %dec = add nsw i32 %1, -1, !dbg !60
  store i32 %dec, i32* %a, align 4, !dbg !60
  br label %if.end4, !dbg !62

if.else:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !63
  %cmp2 = icmp slt i32 %2, 5, !dbg !65
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !66

if.then3:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !67
  %inc = add nsw i32 %3, 1, !dbg !67
  store i32 %inc, i32* %a, align 4, !dbg !67
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %4 = load i32, i32* %a, align 4, !dbg !70
  %cmp5 = icmp ne i32 %4, 5, !dbg !72
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !73

if.then6:                                         ; preds = %if.end4
  br label %LOOP, !dbg !74

if.else7:                                         ; preds = %if.end4
  %5 = load i32, i32* %a, align 4, !dbg !76
  %call8 = call i32 @recursive(i32 %5), !dbg !78
  store i32 %call8, i32* %a, align 4, !dbg !79
  %6 = load i32, i32* %a, align 4, !dbg !80
  %idxprom = sext i32 %6 to i64, !dbg !81
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !81
  store i32 1, i32* %arrayidx, align 4, !dbg !82
  br label %if.end9

if.end9:                                          ; preds = %if.else7
  br label %while.body, !dbg !83

while.body:                                       ; preds = %if.end14, %if.end9
  call void @increment(i32* %a), !dbg !84
  %7 = load i32, i32* %a, align 4, !dbg !86
  %cmp10 = icmp eq i32 %7, 10, !dbg !88
  br i1 %cmp10, label %if.then11, label %if.end14, !dbg !89

if.then11:                                        ; preds = %while.body
  %8 = load i32, i32* %a, align 4, !dbg !90
  %idxprom12 = sext i32 %8 to i64, !dbg !92
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom12, !dbg !92
  store i32 1, i32* %arrayidx13, align 4, !dbg !93
  call void @exit(i32 0) #6, !dbg !94
  unreachable, !dbg !94

if.end14:                                         ; preds = %while.body
  br label %while.body, !dbg !83, !llvm.loop !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "increment", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 21, scope: !9)
!17 = !DILocation(line: 8, column: 8, scope: !9)
!18 = !DILocation(line: 8, column: 7, scope: !9)
!19 = !DILocation(line: 8, column: 10, scope: !9)
!20 = !DILocation(line: 8, column: 3, scope: !9)
!21 = !DILocation(line: 8, column: 5, scope: !9)
!22 = !DILocation(line: 9, column: 1, scope: !9)
!23 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 11, type: !24, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{!14, !14}
!26 = !DILocalVariable(name: "a", arg: 1, scope: !23, file: !10, line: 11, type: !14)
!27 = !DILocation(line: 11, column: 19, scope: !23)
!28 = !DILocation(line: 12, column: 3, scope: !23)
!29 = !DILocation(line: 13, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !10, line: 13, column: 5)
!31 = !DILocation(line: 13, column: 5, scope: !23)
!32 = !DILocation(line: 14, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !10, line: 13, column: 8)
!34 = !DILocation(line: 14, column: 7, scope: !33)
!35 = !DILocation(line: 14, column: 5, scope: !33)
!36 = !DILocation(line: 15, column: 2, scope: !33)
!37 = !DILocation(line: 16, column: 9, scope: !23)
!38 = !DILocation(line: 16, column: 2, scope: !23)
!39 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 19, type: !40, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!14}
!42 = !DILocalVariable(name: "buffer", scope: !39, file: !10, line: 20, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 10)
!46 = !DILocation(line: 20, column: 6, scope: !39)
!47 = !DILocation(line: 21, column: 8, scope: !39)
!48 = !DILocation(line: 21, column: 2, scope: !39)
!49 = !DILocalVariable(name: "a", scope: !39, file: !10, line: 22, type: !14)
!50 = !DILocation(line: 22, column: 9, scope: !39)
!51 = !DILocation(line: 22, column: 13, scope: !39)
!52 = !DILocation(line: 22, column: 20, scope: !39)
!53 = !DILocation(line: 22, column: 5, scope: !39)
!54 = !DILabel(scope: !39, name: "LOOP", file: !10, line: 24)
!55 = !DILocation(line: 24, column: 2, scope: !39)
!56 = !DILocation(line: 25, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !39, file: !10, line: 25, column: 5)
!58 = !DILocation(line: 25, column: 7, scope: !57)
!59 = !DILocation(line: 25, column: 5, scope: !39)
!60 = !DILocation(line: 26, column: 4, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 25, column: 12)
!62 = !DILocation(line: 27, column: 2, scope: !61)
!63 = !DILocation(line: 28, column: 10, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !10, line: 28, column: 10)
!65 = !DILocation(line: 28, column: 12, scope: !64)
!66 = !DILocation(line: 28, column: 10, scope: !57)
!67 = !DILocation(line: 29, column: 4, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !10, line: 28, column: 17)
!69 = !DILocation(line: 30, column: 2, scope: !68)
!70 = !DILocation(line: 32, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !39, file: !10, line: 32, column: 5)
!72 = !DILocation(line: 32, column: 7, scope: !71)
!73 = !DILocation(line: 32, column: 5, scope: !39)
!74 = !DILocation(line: 33, column: 3, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 32, column: 13)
!76 = !DILocation(line: 37, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !10, line: 35, column: 7)
!78 = !DILocation(line: 37, column: 7, scope: !77)
!79 = !DILocation(line: 37, column: 5, scope: !77)
!80 = !DILocation(line: 39, column: 10, scope: !77)
!81 = !DILocation(line: 39, column: 3, scope: !77)
!82 = !DILocation(line: 39, column: 13, scope: !77)
!83 = !DILocation(line: 41, column: 2, scope: !39)
!84 = !DILocation(line: 42, column: 3, scope: !85)
!85 = distinct !DILexicalBlock(scope: !39, file: !10, line: 41, column: 14)
!86 = !DILocation(line: 44, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !85, file: !10, line: 44, column: 6)
!88 = !DILocation(line: 44, column: 8, scope: !87)
!89 = !DILocation(line: 44, column: 6, scope: !85)
!90 = !DILocation(line: 45, column: 11, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !10, line: 44, column: 15)
!92 = !DILocation(line: 45, column: 4, scope: !91)
!93 = !DILocation(line: 45, column: 14, scope: !91)
!94 = !DILocation(line: 46, column: 4, scope: !91)
!95 = distinct !{!95, !83, !96}
!96 = !DILocation(line: 48, column: 2, scope: !39)
