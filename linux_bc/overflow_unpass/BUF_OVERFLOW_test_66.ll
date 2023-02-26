; ModuleID = 'linux_bc/overflow_unpass/BUF_OVERFLOW_test_66.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_66.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @baseConversion(i32 %i, i32 %base) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %base.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %base, i32* %base.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %base.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %i.addr, align 4, !dbg !18
  %cmp = icmp eq i32 %0, 0, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !22
  br label %return, !dbg !22

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4, !dbg !24
  %2 = load i32, i32* %base.addr, align 4, !dbg !25
  %rem = srem i32 %1, %2, !dbg !26
  %3 = load i32, i32* %i.addr, align 4, !dbg !27
  %4 = load i32, i32* %base.addr, align 4, !dbg !28
  %div = sdiv i32 %3, %4, !dbg !29
  %5 = load i32, i32* %base.addr, align 4, !dbg !30
  %call = call i32 @baseConversion(i32 %div, i32 %5), !dbg !31
  %mul = mul nsw i32 10, %call, !dbg !32
  %add = add nsw i32 %rem, %mul, !dbg !33
  store i32 %add, i32* %retval, align 4, !dbg !34
  br label %return, !dbg !34

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %6, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !36 {
entry:
  %buffer1 = alloca [1747 x i32], align 16
  %buffer2 = alloca [1746 x i32], align 16
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [1747 x i32]* %buffer1, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [1746 x i32]* %buffer2, metadata !44, metadata !DIExpression()), !dbg !48
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !49
  call void @srand(i32 %call) #4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !51, metadata !DIExpression()), !dbg !52
  %call1 = call i32 @rand() #4, !dbg !53
  %rem = srem i32 %call1, 999, !dbg !54
  store i32 %rem, i32* %randomNumber, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %i, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* %randomNumber, align 4, !dbg !57
  %call2 = call i32 @baseConversion(i32 %0, i32 8), !dbg !58
  store i32 %call2, i32* %i, align 4, !dbg !56
  %1 = load i32, i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %1 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [1747 x i32], [1747 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  %2 = load i32, i32* %i, align 4, !dbg !62
  %idxprom3 = sext i32 %2 to i64, !dbg !63
  %arrayidx4 = getelementptr inbounds [1746 x i32], [1746 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !63
  store i32 1, i32* %arrayidx4, align 4, !dbg !64
  ret i32 0, !dbg !65
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_66.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_66.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 24, scope: !9)
!16 = !DILocalVariable(name: "base", arg: 2, scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 31, scope: !9)
!18 = !DILocation(line: 8, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 8)
!20 = !DILocation(line: 8, column: 10, scope: !19)
!21 = !DILocation(line: 8, column: 8, scope: !9)
!22 = !DILocation(line: 9, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !10, line: 8, column: 16)
!24 = !DILocation(line: 11, column: 12, scope: !9)
!25 = !DILocation(line: 11, column: 16, scope: !9)
!26 = !DILocation(line: 11, column: 14, scope: !9)
!27 = !DILocation(line: 11, column: 43, scope: !9)
!28 = !DILocation(line: 11, column: 47, scope: !9)
!29 = !DILocation(line: 11, column: 45, scope: !9)
!30 = !DILocation(line: 11, column: 53, scope: !9)
!31 = !DILocation(line: 11, column: 28, scope: !9)
!32 = !DILocation(line: 11, column: 26, scope: !9)
!33 = !DILocation(line: 11, column: 21, scope: !9)
!34 = !DILocation(line: 11, column: 5, scope: !9)
!35 = !DILocation(line: 12, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !37, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!13}
!39 = !DILocalVariable(name: "buffer1", scope: !36, file: !10, line: 15, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 55904, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 1747)
!43 = !DILocation(line: 15, column: 9, scope: !36)
!44 = !DILocalVariable(name: "buffer2", scope: !36, file: !10, line: 16, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 55872, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 1746)
!48 = !DILocation(line: 16, column: 6, scope: !36)
!49 = !DILocation(line: 17, column: 8, scope: !36)
!50 = !DILocation(line: 17, column: 2, scope: !36)
!51 = !DILocalVariable(name: "randomNumber", scope: !36, file: !10, line: 18, type: !13)
!52 = !DILocation(line: 18, column: 9, scope: !36)
!53 = !DILocation(line: 18, column: 24, scope: !36)
!54 = !DILocation(line: 18, column: 31, scope: !36)
!55 = !DILocalVariable(name: "i", scope: !36, file: !10, line: 20, type: !13)
!56 = !DILocation(line: 20, column: 9, scope: !36)
!57 = !DILocation(line: 20, column: 28, scope: !36)
!58 = !DILocation(line: 20, column: 13, scope: !36)
!59 = !DILocation(line: 22, column: 10, scope: !36)
!60 = !DILocation(line: 22, column: 2, scope: !36)
!61 = !DILocation(line: 22, column: 13, scope: !36)
!62 = !DILocation(line: 23, column: 10, scope: !36)
!63 = !DILocation(line: 23, column: 2, scope: !36)
!64 = !DILocation(line: 23, column: 13, scope: !36)
!65 = !DILocation(line: 24, column: 1, scope: !36)
