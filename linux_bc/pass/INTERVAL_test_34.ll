; ModuleID = 'linux_bc/pass/INTERVAL_test_34.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@digitCount.counter = internal global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @digitCount(i32 %i) #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %cmp = icmp sgt i32 %0, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @digitCount.counter, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* @digitCount.counter, align 4, !dbg !23
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %div = sdiv i32 %2, 10, !dbg !26
  %call = call i32 @digitCount(i32 %div), !dbg !27
  store i32 %call, i32* %retval, align 4, !dbg !28
  br label %return, !dbg !28

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @digitCount.counter, align 4, !dbg !29
  store i32 %3, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %4, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !36
  call void @srand(i32 %call) #4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !38, metadata !DIExpression()), !dbg !39
  %call1 = call i32 @rand() #4, !dbg !40
  %rem = srem i32 %call1, 999, !dbg !41
  %add = add nsw i32 1, %rem, !dbg !42
  store i32 %add, i32* %randomNumber, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32, i32* %randomNumber, align 4, !dbg !45
  %call2 = call i32 @digitCount(i32 %0), !dbg !46
  store i32 %call2, i32* %counter, align 4, !dbg !44
  %1 = load i32, i32* %counter, align 4, !dbg !47
  %cmp = icmp sge i32 %1, 1, !dbg !48
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !49

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !50
  %cmp3 = icmp sle i32 %2, 3, !dbg !51
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !52
  call void @svf_assert(i1 zeroext %3), !dbg !53
  %4 = load i32, i32* %retval, align 4, !dbg !54
  ret i32 %4, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 8, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "digitCount", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "src/pass/INTERVAL_test_34.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_34.c", directory: "/home/SVF-tools/SSE-TestCases")
!9 = !{}
!10 = !{!0}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!18 = !DILocation(line: 7, column: 20, scope: !2)
!19 = !DILocation(line: 9, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !2, file: !3, line: 9, column: 8)
!21 = !DILocation(line: 9, column: 10, scope: !20)
!22 = !DILocation(line: 9, column: 8, scope: !2)
!23 = !DILocation(line: 10, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !3, line: 9, column: 15)
!25 = !DILocation(line: 11, column: 27, scope: !24)
!26 = !DILocation(line: 11, column: 28, scope: !24)
!27 = !DILocation(line: 11, column: 16, scope: !24)
!28 = !DILocation(line: 11, column: 9, scope: !24)
!29 = !DILocation(line: 14, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !3, line: 13, column: 10)
!31 = !DILocation(line: 14, column: 9, scope: !30)
!32 = !DILocation(line: 16, column: 1, scope: !2)
!33 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 18, type: !34, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocation(line: 19, column: 11, scope: !33)
!37 = !DILocation(line: 19, column: 5, scope: !33)
!38 = !DILocalVariable(name: "randomNumber", scope: !33, file: !3, line: 20, type: !6)
!39 = !DILocation(line: 20, column: 6, scope: !33)
!40 = !DILocation(line: 20, column: 25, scope: !33)
!41 = !DILocation(line: 20, column: 32, scope: !33)
!42 = !DILocation(line: 20, column: 23, scope: !33)
!43 = !DILocalVariable(name: "counter", scope: !33, file: !3, line: 21, type: !6)
!44 = !DILocation(line: 21, column: 9, scope: !33)
!45 = !DILocation(line: 21, column: 30, scope: !33)
!46 = !DILocation(line: 21, column: 19, scope: !33)
!47 = !DILocation(line: 22, column: 16, scope: !33)
!48 = !DILocation(line: 22, column: 24, scope: !33)
!49 = !DILocation(line: 22, column: 29, scope: !33)
!50 = !DILocation(line: 22, column: 32, scope: !33)
!51 = !DILocation(line: 22, column: 40, scope: !33)
!52 = !DILocation(line: 0, scope: !33)
!53 = !DILocation(line: 22, column: 5, scope: !33)
!54 = !DILocation(line: 23, column: 1, scope: !33)
