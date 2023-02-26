; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo() #0 !dbg !9 {
entry:
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %i, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i8* %a, metadata !17, metadata !DIExpression()), !dbg !19
  store i8 1, i8* %a, align 1, !dbg !19
  br label %do.body, !dbg !20

do.body:                                          ; preds = %land.end, %entry
  %0 = load i32, i32* %i, align 4, !dbg !21
  %inc = add nsw i32 %0, 1, !dbg !21
  store i32 %inc, i32* %i, align 4, !dbg !21
  br label %do.cond, !dbg !23

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %i, align 4, !dbg !24
  %cmp = icmp slt i32 %1, 5, !dbg !25
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !26

land.rhs:                                         ; preds = %do.cond
  %2 = load i8, i8* %a, align 1, !dbg !27
  %tobool = trunc i8 %2 to i1, !dbg !27
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %3 = phi i1 [ false, %do.cond ], [ %tobool, %land.rhs ], !dbg !28
  br i1 %3, label %do.body, label %do.end, !dbg !23, !llvm.loop !29

do.end:                                           ; preds = %land.end
  %4 = load i32, i32* %i, align 4, !dbg !32
  ret i32 %4, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @bar() #0 !dbg !34 {
entry:
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 0, i32* %i, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i8* %a, metadata !37, metadata !DIExpression()), !dbg !38
  store i8 0, i8* %a, align 1, !dbg !38
  br label %do.body, !dbg !39

do.body:                                          ; preds = %land.end, %entry
  %0 = load i32, i32* %i, align 4, !dbg !40
  %inc = add nsw i32 %0, 1, !dbg !40
  store i32 %inc, i32* %i, align 4, !dbg !40
  br label %do.cond, !dbg !42

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %i, align 4, !dbg !43
  %cmp = icmp slt i32 %1, 5, !dbg !44
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !45

land.rhs:                                         ; preds = %do.cond
  %2 = load i8, i8* %a, align 1, !dbg !46
  %tobool = trunc i8 %2 to i1, !dbg !46
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %3 = phi i1 [ false, %do.cond ], [ %tobool, %land.rhs ], !dbg !47
  br i1 %3, label %do.body, label %do.end, !dbg !42, !llvm.loop !48

do.end:                                           ; preds = %land.end
  %4 = load i32, i32* %i, align 4, !dbg !50
  ret i32 %4, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !53, metadata !DIExpression()), !dbg !57
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !58
  call void @srand(i32 noundef %call), !dbg !59
  call void @llvm.dbg.declare(metadata i32* %a, metadata !60, metadata !DIExpression()), !dbg !61
  %call1 = call i32 @rand(), !dbg !62
  %rem = srem i32 %call1, 2, !dbg !63
  store i32 %rem, i32* %a, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %b, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32, i32* %a, align 4, !dbg !66
  %tobool = icmp ne i32 %0, 0, !dbg !67
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !67

cond.true:                                        ; preds = %entry
  %call2 = call i32 @foo(), !dbg !68
  br label %cond.end, !dbg !67

cond.false:                                       ; preds = %entry
  %call3 = call i32 @bar(), !dbg !69
  br label %cond.end, !dbg !67

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %call3, %cond.false ], !dbg !67
  store i32 %cond, i32* %b, align 4, !dbg !65
  %1 = load i32, i32* %a, align 4, !dbg !70
  %tobool4 = icmp ne i32 %1, 0, !dbg !70
  br i1 %tobool4, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %cond.end
  %2 = load i32, i32* %b, align 4, !dbg !73
  %idxprom = sext i32 %2 to i64, !dbg !75
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !75
  store i32 1, i32* %arrayidx, align 4, !dbg !76
  br label %if.end, !dbg !77

if.else:                                          ; preds = %cond.end
  %3 = load i32, i32* %b, align 4, !dbg !78
  %idxprom5 = sext i32 %3 to i64, !dbg !80
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !80
  store i32 1, i32* %arrayidx6, align 4, !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !82
  ret i32 %4, !dbg !82
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 9, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !18)
!18 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!19 = !DILocation(line: 9, column: 10, scope: !9)
!20 = !DILocation(line: 10, column: 5, scope: !9)
!21 = !DILocation(line: 11, column: 10, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!23 = !DILocation(line: 12, column: 5, scope: !22)
!24 = !DILocation(line: 12, column: 13, scope: !9)
!25 = !DILocation(line: 12, column: 15, scope: !9)
!26 = !DILocation(line: 12, column: 19, scope: !9)
!27 = !DILocation(line: 12, column: 22, scope: !9)
!28 = !DILocation(line: 0, scope: !9)
!29 = distinct !{!29, !20, !30, !31}
!30 = !DILocation(line: 12, column: 23, scope: !9)
!31 = !{!"llvm.loop.mustprogress"}
!32 = !DILocation(line: 13, column: 12, scope: !9)
!33 = !DILocation(line: 13, column: 5, scope: !9)
!34 = distinct !DISubprogram(name: "bar", scope: !10, file: !10, line: 16, type: !11, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!35 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 17, type: !13)
!36 = !DILocation(line: 17, column: 9, scope: !34)
!37 = !DILocalVariable(name: "a", scope: !34, file: !10, line: 18, type: !18)
!38 = !DILocation(line: 18, column: 10, scope: !34)
!39 = !DILocation(line: 19, column: 5, scope: !34)
!40 = !DILocation(line: 20, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !10, line: 19, column: 8)
!42 = !DILocation(line: 21, column: 5, scope: !41)
!43 = !DILocation(line: 21, column: 13, scope: !34)
!44 = !DILocation(line: 21, column: 15, scope: !34)
!45 = !DILocation(line: 21, column: 19, scope: !34)
!46 = !DILocation(line: 21, column: 22, scope: !34)
!47 = !DILocation(line: 0, scope: !34)
!48 = distinct !{!48, !39, !49, !31}
!49 = !DILocation(line: 21, column: 23, scope: !34)
!50 = !DILocation(line: 22, column: 12, scope: !34)
!51 = !DILocation(line: 22, column: 5, scope: !34)
!52 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 25, type: !11, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!53 = !DILocalVariable(name: "buffer", scope: !52, file: !10, line: 26, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 5)
!57 = !DILocation(line: 26, column: 6, scope: !52)
!58 = !DILocation(line: 27, column: 8, scope: !52)
!59 = !DILocation(line: 27, column: 2, scope: !52)
!60 = !DILocalVariable(name: "a", scope: !52, file: !10, line: 28, type: !13)
!61 = !DILocation(line: 28, column: 6, scope: !52)
!62 = !DILocation(line: 28, column: 10, scope: !52)
!63 = !DILocation(line: 28, column: 17, scope: !52)
!64 = !DILocalVariable(name: "b", scope: !52, file: !10, line: 29, type: !13)
!65 = !DILocation(line: 29, column: 9, scope: !52)
!66 = !DILocation(line: 29, column: 14, scope: !52)
!67 = !DILocation(line: 29, column: 13, scope: !52)
!68 = !DILocation(line: 29, column: 19, scope: !52)
!69 = !DILocation(line: 29, column: 27, scope: !52)
!70 = !DILocation(line: 30, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !52, file: !10, line: 30, column: 8)
!72 = !DILocation(line: 30, column: 8, scope: !52)
!73 = !DILocation(line: 32, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !10, line: 30, column: 11)
!75 = !DILocation(line: 32, column: 9, scope: !74)
!76 = !DILocation(line: 32, column: 19, scope: !74)
!77 = !DILocation(line: 33, column: 5, scope: !74)
!78 = !DILocation(line: 36, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !10, line: 34, column: 10)
!80 = !DILocation(line: 36, column: 9, scope: !79)
!81 = !DILocation(line: 36, column: 19, scope: !79)
!82 = !DILocation(line: 38, column: 1, scope: !52)
