; ModuleID = 'linux_bc/pass/INTERVAL_test_25.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_25.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo() #0 !dbg !9 {
entry:
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %i, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i8* %a, metadata !16, metadata !DIExpression()), !dbg !18
  store i8 1, i8* %a, align 1, !dbg !18
  br label %do.body, !dbg !19

do.body:                                          ; preds = %land.end, %entry
  %0 = load i32, i32* %i, align 4, !dbg !20
  %inc = add nsw i32 %0, 1, !dbg !20
  store i32 %inc, i32* %i, align 4, !dbg !20
  br label %do.cond, !dbg !22

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %i, align 4, !dbg !23
  %cmp = icmp slt i32 %1, 5, !dbg !24
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !25

land.rhs:                                         ; preds = %do.cond
  %2 = load i8, i8* %a, align 1, !dbg !26
  %tobool = trunc i8 %2 to i1, !dbg !26
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %3 = phi i1 [ false, %do.cond ], [ %tobool, %land.rhs ], !dbg !27
  br i1 %3, label %do.body, label %do.end, !dbg !22, !llvm.loop !28

do.end:                                           ; preds = %land.end
  %4 = load i32, i32* %i, align 4, !dbg !31
  ret i32 %4, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bar() #0 !dbg !33 {
entry:
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i8* %a, metadata !36, metadata !DIExpression()), !dbg !37
  store i8 0, i8* %a, align 1, !dbg !37
  br label %do.body, !dbg !38

do.body:                                          ; preds = %land.end, %entry
  %0 = load i32, i32* %i, align 4, !dbg !39
  %inc = add nsw i32 %0, 1, !dbg !39
  store i32 %inc, i32* %i, align 4, !dbg !39
  br label %do.cond, !dbg !41

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %1, 5, !dbg !43
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !44

land.rhs:                                         ; preds = %do.cond
  %2 = load i8, i8* %a, align 1, !dbg !45
  %tobool = trunc i8 %2 to i1, !dbg !45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %3 = phi i1 [ false, %do.cond ], [ %tobool, %land.rhs ], !dbg !46
  br i1 %3, label %do.body, label %do.end, !dbg !41, !llvm.loop !47

do.end:                                           ; preds = %land.end
  %4 = load i32, i32* %i, align 4, !dbg !49
  ret i32 %4, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !52
  call void @srand(i32 %call) #4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %a, metadata !54, metadata !DIExpression()), !dbg !55
  %call1 = call i32 @rand() #4, !dbg !56
  %rem = srem i32 %call1, 2, !dbg !57
  store i32 %rem, i32* %a, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %b, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32, i32* %a, align 4, !dbg !60
  %tobool = icmp ne i32 %0, 0, !dbg !61
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !61

cond.true:                                        ; preds = %entry
  %call2 = call i32 @foo(), !dbg !62
  br label %cond.end, !dbg !61

cond.false:                                       ; preds = %entry
  %call3 = call i32 @bar(), !dbg !63
  br label %cond.end, !dbg !61

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %call3, %cond.false ], !dbg !61
  store i32 %cond, i32* %b, align 4, !dbg !59
  %1 = load i32, i32* %a, align 4, !dbg !64
  %tobool4 = icmp ne i32 %1, 0, !dbg !64
  br i1 %tobool4, label %if.then, label %if.else, !dbg !66

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %b, align 4, !dbg !67
  %cmp = icmp eq i32 %2, 5, !dbg !69
  call void @svf_assert(i1 zeroext %cmp), !dbg !70
  br label %if.end, !dbg !71

if.else:                                          ; preds = %cond.end
  %3 = load i32, i32* %b, align 4, !dbg !72
  %cmp5 = icmp eq i32 %3, 1, !dbg !74
  call void @svf_assert(i1 zeroext %cmp5), !dbg !75
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !76
  ret i32 %4, !dbg !76
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_25.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_25.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 9, scope: !9)
!16 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !17)
!17 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!18 = !DILocation(line: 9, column: 10, scope: !9)
!19 = !DILocation(line: 10, column: 5, scope: !9)
!20 = !DILocation(line: 11, column: 10, scope: !21)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!22 = !DILocation(line: 12, column: 5, scope: !21)
!23 = !DILocation(line: 12, column: 13, scope: !9)
!24 = !DILocation(line: 12, column: 15, scope: !9)
!25 = !DILocation(line: 12, column: 19, scope: !9)
!26 = !DILocation(line: 12, column: 22, scope: !9)
!27 = !DILocation(line: 0, scope: !9)
!28 = distinct !{!28, !19, !29, !30}
!29 = !DILocation(line: 12, column: 23, scope: !9)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !DILocation(line: 13, column: 12, scope: !9)
!32 = !DILocation(line: 13, column: 5, scope: !9)
!33 = distinct !DISubprogram(name: "bar", scope: !10, file: !10, line: 16, type: !11, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 17, type: !13)
!35 = !DILocation(line: 17, column: 9, scope: !33)
!36 = !DILocalVariable(name: "a", scope: !33, file: !10, line: 18, type: !17)
!37 = !DILocation(line: 18, column: 10, scope: !33)
!38 = !DILocation(line: 19, column: 5, scope: !33)
!39 = !DILocation(line: 20, column: 10, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !10, line: 19, column: 8)
!41 = !DILocation(line: 21, column: 5, scope: !40)
!42 = !DILocation(line: 21, column: 13, scope: !33)
!43 = !DILocation(line: 21, column: 15, scope: !33)
!44 = !DILocation(line: 21, column: 19, scope: !33)
!45 = !DILocation(line: 21, column: 22, scope: !33)
!46 = !DILocation(line: 0, scope: !33)
!47 = distinct !{!47, !38, !48, !30}
!48 = !DILocation(line: 21, column: 23, scope: !33)
!49 = !DILocation(line: 22, column: 12, scope: !33)
!50 = !DILocation(line: 22, column: 5, scope: !33)
!51 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 25, type: !11, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 26, column: 8, scope: !51)
!53 = !DILocation(line: 26, column: 2, scope: !51)
!54 = !DILocalVariable(name: "a", scope: !51, file: !10, line: 27, type: !13)
!55 = !DILocation(line: 27, column: 6, scope: !51)
!56 = !DILocation(line: 27, column: 10, scope: !51)
!57 = !DILocation(line: 27, column: 17, scope: !51)
!58 = !DILocalVariable(name: "b", scope: !51, file: !10, line: 28, type: !13)
!59 = !DILocation(line: 28, column: 9, scope: !51)
!60 = !DILocation(line: 28, column: 14, scope: !51)
!61 = !DILocation(line: 28, column: 13, scope: !51)
!62 = !DILocation(line: 28, column: 19, scope: !51)
!63 = !DILocation(line: 28, column: 27, scope: !51)
!64 = !DILocation(line: 29, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !51, file: !10, line: 29, column: 8)
!66 = !DILocation(line: 29, column: 8, scope: !51)
!67 = !DILocation(line: 30, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 29, column: 11)
!69 = !DILocation(line: 30, column: 22, scope: !68)
!70 = !DILocation(line: 30, column: 9, scope: !68)
!71 = !DILocation(line: 31, column: 5, scope: !68)
!72 = !DILocation(line: 33, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !65, file: !10, line: 32, column: 10)
!74 = !DILocation(line: 33, column: 22, scope: !73)
!75 = !DILocation(line: 33, column: 9, scope: !73)
!76 = !DILocation(line: 35, column: 1, scope: !51)
