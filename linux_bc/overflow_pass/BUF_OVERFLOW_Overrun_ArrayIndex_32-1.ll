; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_32-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_32-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @loop(i32 %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %output, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %output, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 1, i32* %i, align 4, !dbg !19
  br label %while.body, !dbg !20

while.body:                                       ; preds = %if.end3, %entry
  %0 = load i32, i32* %i, align 4, !dbg !21
  %rem = srem i32 %0, 2, !dbg !24
  %cmp = icmp eq i32 %rem, 0, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %while.body
  %1 = load i32, i32* %output, align 4, !dbg !27
  %inc = add nsw i32 %1, 1, !dbg !27
  store i32 %inc, i32* %output, align 4, !dbg !27
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %while.body
  %2 = load i32, i32* %i, align 4, !dbg !30
  %3 = load i32, i32* %a.addr, align 4, !dbg !32
  %cmp1 = icmp eq i32 %2, %3, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !34

if.then2:                                         ; preds = %if.end
  br label %while.end, !dbg !35

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !37
  %inc4 = add nsw i32 %4, 1, !dbg !37
  store i32 %inc4, i32* %i, align 4, !dbg !37
  br label %while.body, !dbg !20, !llvm.loop !38

while.end:                                        ; preds = %if.then2
  %5 = load i32, i32* %output, align 4, !dbg !40
  ret i32 %5, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %output = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !45, metadata !DIExpression()), !dbg !49
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !50
  call void @srand(i32 %call) #4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %a, metadata !52, metadata !DIExpression()), !dbg !53
  %call1 = call i32 @rand() #4, !dbg !54
  %rem = srem i32 %call1, 11, !dbg !55
  store i32 %rem, i32* %a, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %output, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 0, i32* %output, align 4, !dbg !57
  %0 = load i32, i32* %a, align 4, !dbg !58
  %cmp = icmp sgt i32 %0, 0, !dbg !60
  br i1 %cmp, label %if.then, label %if.else, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !62
  %call2 = call i32 @loop(i32 %1), !dbg !64
  store i32 %call2, i32* %output, align 4, !dbg !65
  %2 = load i32, i32* %output, align 4, !dbg !66
  %idxprom = sext i32 %2 to i64, !dbg !67
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !67
  store i32 1, i32* %arrayidx, align 4, !dbg !68
  br label %if.end, !dbg !69

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %output, align 4, !dbg !70
  %idxprom3 = sext i32 %3 to i64, !dbg !72
  %arrayidx4 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !72
  store i32 1, i32* %arrayidx4, align 4, !dbg !73
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !74
  ret i32 %4, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_32-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "loop", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_32-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 14, scope: !9)
!16 = !DILocalVariable(name: "output", scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 9, type: !13)
!19 = !DILocation(line: 9, column: 9, scope: !9)
!20 = !DILocation(line: 10, column: 5, scope: !9)
!21 = !DILocation(line: 11, column: 12, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !10, line: 11, column: 12)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 17)
!24 = !DILocation(line: 11, column: 14, scope: !22)
!25 = !DILocation(line: 11, column: 18, scope: !22)
!26 = !DILocation(line: 11, column: 12, scope: !23)
!27 = !DILocation(line: 12, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !10, line: 11, column: 24)
!29 = !DILocation(line: 13, column: 9, scope: !28)
!30 = !DILocation(line: 14, column: 12, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !10, line: 14, column: 12)
!32 = !DILocation(line: 14, column: 17, scope: !31)
!33 = !DILocation(line: 14, column: 14, scope: !31)
!34 = !DILocation(line: 14, column: 12, scope: !23)
!35 = !DILocation(line: 15, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !10, line: 14, column: 20)
!37 = !DILocation(line: 17, column: 10, scope: !23)
!38 = distinct !{!38, !20, !39}
!39 = !DILocation(line: 18, column: 5, scope: !9)
!40 = !DILocation(line: 19, column: 12, scope: !9)
!41 = !DILocation(line: 19, column: 5, scope: !9)
!42 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 22, type: !43, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!13}
!45 = !DILocalVariable(name: "buffer", scope: !42, file: !10, line: 23, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 5)
!49 = !DILocation(line: 23, column: 6, scope: !42)
!50 = !DILocation(line: 24, column: 11, scope: !42)
!51 = !DILocation(line: 24, column: 5, scope: !42)
!52 = !DILocalVariable(name: "a", scope: !42, file: !10, line: 25, type: !13)
!53 = !DILocation(line: 25, column: 9, scope: !42)
!54 = !DILocation(line: 25, column: 13, scope: !42)
!55 = !DILocation(line: 25, column: 20, scope: !42)
!56 = !DILocalVariable(name: "output", scope: !42, file: !10, line: 27, type: !13)
!57 = !DILocation(line: 27, column: 9, scope: !42)
!58 = !DILocation(line: 28, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !42, file: !10, line: 28, column: 8)
!60 = !DILocation(line: 28, column: 10, scope: !59)
!61 = !DILocation(line: 28, column: 8, scope: !42)
!62 = !DILocation(line: 29, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 28, column: 15)
!64 = !DILocation(line: 29, column: 18, scope: !63)
!65 = !DILocation(line: 29, column: 16, scope: !63)
!66 = !DILocation(line: 31, column: 16, scope: !63)
!67 = !DILocation(line: 31, column: 9, scope: !63)
!68 = !DILocation(line: 31, column: 24, scope: !63)
!69 = !DILocation(line: 32, column: 5, scope: !63)
!70 = !DILocation(line: 34, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !59, file: !10, line: 33, column: 10)
!72 = !DILocation(line: 34, column: 9, scope: !71)
!73 = !DILocation(line: 34, column: 24, scope: !71)
!74 = !DILocation(line: 36, column: 1, scope: !42)
