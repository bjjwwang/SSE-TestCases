; ModuleID = 'linux_bc/pass/INTERVAL_test_45.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_45.c"
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
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !39
  call void @srand(i32 %call) #4, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !41, metadata !DIExpression()), !dbg !42
  %call1 = call i32 @rand() #4, !dbg !43
  %rem = srem i32 %call1, 999, !dbg !44
  store i32 %rem, i32* %randomNumber, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* %randomNumber, align 4, !dbg !47
  %call2 = call i32 @baseConversion(i32 %0, i32 8), !dbg !48
  store i32 %call2, i32* %i, align 4, !dbg !46
  %1 = load i32, i32* %i, align 4, !dbg !49
  %cmp = icmp sge i32 %1, 0, !dbg !50
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !51

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !52
  %cmp3 = icmp sle i32 %2, 1746, !dbg !53
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !54
  call void @svf_assert(i1 zeroext %3), !dbg !55
  %4 = load i32, i32* %retval, align 4, !dbg !56
  ret i32 %4, !dbg !56
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_45.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_45.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 24, scope: !9)
!16 = !DILocalVariable(name: "base", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 31, scope: !9)
!18 = !DILocation(line: 9, column: 8, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!20 = !DILocation(line: 9, column: 10, scope: !19)
!21 = !DILocation(line: 9, column: 8, scope: !9)
!22 = !DILocation(line: 10, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !10, line: 9, column: 16)
!24 = !DILocation(line: 12, column: 12, scope: !9)
!25 = !DILocation(line: 12, column: 16, scope: !9)
!26 = !DILocation(line: 12, column: 14, scope: !9)
!27 = !DILocation(line: 12, column: 43, scope: !9)
!28 = !DILocation(line: 12, column: 47, scope: !9)
!29 = !DILocation(line: 12, column: 45, scope: !9)
!30 = !DILocation(line: 12, column: 53, scope: !9)
!31 = !DILocation(line: 12, column: 28, scope: !9)
!32 = !DILocation(line: 12, column: 26, scope: !9)
!33 = !DILocation(line: 12, column: 21, scope: !9)
!34 = !DILocation(line: 12, column: 5, scope: !9)
!35 = !DILocation(line: 13, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !37, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!13}
!39 = !DILocation(line: 16, column: 11, scope: !36)
!40 = !DILocation(line: 16, column: 5, scope: !36)
!41 = !DILocalVariable(name: "randomNumber", scope: !36, file: !10, line: 17, type: !13)
!42 = !DILocation(line: 17, column: 9, scope: !36)
!43 = !DILocation(line: 17, column: 24, scope: !36)
!44 = !DILocation(line: 17, column: 31, scope: !36)
!45 = !DILocalVariable(name: "i", scope: !36, file: !10, line: 19, type: !13)
!46 = !DILocation(line: 19, column: 9, scope: !36)
!47 = !DILocation(line: 19, column: 28, scope: !36)
!48 = !DILocation(line: 19, column: 13, scope: !36)
!49 = !DILocation(line: 20, column: 16, scope: !36)
!50 = !DILocation(line: 20, column: 18, scope: !36)
!51 = !DILocation(line: 20, column: 23, scope: !36)
!52 = !DILocation(line: 20, column: 26, scope: !36)
!53 = !DILocation(line: 20, column: 28, scope: !36)
!54 = !DILocation(line: 0, scope: !36)
!55 = !DILocation(line: 20, column: 5, scope: !36)
!56 = !DILocation(line: 21, column: 1, scope: !36)
