; ModuleID = 'linux_bc/pass/INTERVAL_test_52.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_52.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @digitCount(i32 %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %counter, align 4, !dbg !17
  br label %while.body, !dbg !18

while.body:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %div = sdiv i32 %0, 10, !dbg !21
  store i32 %div, i32* %i.addr, align 4, !dbg !22
  %1 = load i32, i32* %counter, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* %counter, align 4, !dbg !23
  %2 = load i32, i32* %i.addr, align 4, !dbg !24
  %cmp = icmp eq i32 %2, 0, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !28

if.end:                                           ; preds = %while.body
  br label %while.body, !dbg !18, !llvm.loop !30

while.end:                                        ; preds = %if.then
  %3 = load i32, i32* %counter, align 4, !dbg !32
  ret i32 %3, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !37
  call void @srand(i32 %call) #4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !39, metadata !DIExpression()), !dbg !40
  %call1 = call i32 @rand() #4, !dbg !41
  %rem = srem i32 %call1, 999, !dbg !42
  store i32 %rem, i32* %randomNumber, align 4, !dbg !40
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_52.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_52.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 20, scope: !9)
!16 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocation(line: 9, column: 5, scope: !9)
!19 = !DILocation(line: 10, column: 13, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 17)
!21 = !DILocation(line: 10, column: 14, scope: !20)
!22 = !DILocation(line: 10, column: 11, scope: !20)
!23 = !DILocation(line: 11, column: 16, scope: !20)
!24 = !DILocation(line: 12, column: 12, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !10, line: 12, column: 12)
!26 = !DILocation(line: 12, column: 14, scope: !25)
!27 = !DILocation(line: 12, column: 12, scope: !20)
!28 = !DILocation(line: 13, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !10, line: 12, column: 20)
!30 = distinct !{!30, !18, !31}
!31 = !DILocation(line: 15, column: 5, scope: !9)
!32 = !DILocation(line: 16, column: 12, scope: !9)
!33 = !DILocation(line: 16, column: 5, scope: !9)
!34 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 19, type: !35, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!13}
!37 = !DILocation(line: 20, column: 11, scope: !34)
!38 = !DILocation(line: 20, column: 5, scope: !34)
!39 = !DILocalVariable(name: "randomNumber", scope: !34, file: !10, line: 21, type: !13)
!40 = !DILocation(line: 21, column: 6, scope: !34)
!41 = !DILocation(line: 21, column: 21, scope: !34)
!42 = !DILocation(line: 21, column: 28, scope: !34)
!43 = !DILocalVariable(name: "counter", scope: !34, file: !10, line: 22, type: !13)
!44 = !DILocation(line: 22, column: 9, scope: !34)
!45 = !DILocation(line: 22, column: 30, scope: !34)
!46 = !DILocation(line: 22, column: 19, scope: !34)
!47 = !DILocation(line: 23, column: 16, scope: !34)
!48 = !DILocation(line: 23, column: 24, scope: !34)
!49 = !DILocation(line: 23, column: 29, scope: !34)
!50 = !DILocation(line: 23, column: 32, scope: !34)
!51 = !DILocation(line: 23, column: 40, scope: !34)
!52 = !DILocation(line: 0, scope: !34)
!53 = !DILocation(line: 23, column: 5, scope: !34)
!54 = !DILocation(line: 24, column: 1, scope: !34)
