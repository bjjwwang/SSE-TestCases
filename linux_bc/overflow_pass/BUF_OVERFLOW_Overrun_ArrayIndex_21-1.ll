; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [6 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 51, !dbg !24
  %sub = sub nsw i32 %rem, 25, !dbg !25
  store i32 %sub, i32* %a, align 4, !dbg !22
  %0 = load i32, i32* %a, align 4, !dbg !26
  %cmp = icmp sge i32 %0, 0, !dbg !28
  br i1 %cmp, label %if.then, label %if.else17, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %b, metadata !30, metadata !DIExpression()), !dbg !32
  %1 = load i32, i32* %a, align 4, !dbg !33
  store i32 %1, i32* %b, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !39
  %cmp2 = icmp slt i32 %2, 5, !dbg !41
  br i1 %cmp2, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %b, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %b, align 4, !dbg !43
  %4 = load i32, i32* %b, align 4, !dbg !45
  %cmp3 = icmp sgt i32 %4, 10, !dbg !47
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !48

if.then4:                                         ; preds = %for.body
  br label %for.end, !dbg !49

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !52
  %inc5 = add nsw i32 %5, 1, !dbg !52
  store i32 %inc5, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %if.then4, %for.cond
  %6 = load i32, i32* %a, align 4, !dbg !57
  %cmp6 = icmp sgt i32 %6, 0, !dbg !59
  br i1 %cmp6, label %land.lhs.true, label %if.end16, !dbg !60

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %i, align 4, !dbg !61
  %cmp7 = icmp eq i32 %7, 5, !dbg !62
  br i1 %cmp7, label %land.lhs.true8, label %if.end16, !dbg !63

land.lhs.true8:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* %b, align 4, !dbg !64
  %rem9 = srem i32 %8, 2, !dbg !65
  %cmp10 = icmp eq i32 %rem9, 0, !dbg !66
  br i1 %cmp10, label %if.then11, label %if.end16, !dbg !67

if.then11:                                        ; preds = %land.lhs.true8
  %9 = load i32, i32* %a, align 4, !dbg !68
  %rem12 = srem i32 %9, 2, !dbg !71
  %tobool = icmp ne i32 %rem12, 0, !dbg !71
  br i1 %tobool, label %if.then13, label %if.else, !dbg !72

if.then13:                                        ; preds = %if.then11
  %10 = load i32, i32* %a, align 4, !dbg !73
  %idxprom = sext i32 %10 to i64, !dbg !75
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !75
  store i32 1, i32* %arrayidx, align 4, !dbg !76
  br label %if.end15, !dbg !77

if.else:                                          ; preds = %if.then11
  %arrayidx14 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 20, !dbg !78
  store i32 1, i32* %arrayidx14, align 16, !dbg !80
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then13
  br label %if.end16, !dbg !81

if.end16:                                         ; preds = %if.end15, %land.lhs.true8, %land.lhs.true, %for.end
  br label %if.end20, !dbg !82

if.else17:                                        ; preds = %entry
  %11 = load i32, i32* %a, align 4, !dbg !83
  %idxprom18 = sext i32 %11 to i64, !dbg !85
  %arrayidx19 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom18, !dbg !85
  store i32 1, i32* %arrayidx19, align 4, !dbg !86
  br label %if.end20

if.end20:                                         ; preds = %if.else17, %if.end16
  %12 = load i32, i32* %retval, align 4, !dbg !87
  ret i32 %12, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_21-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 6)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 11, scope: !9)
!20 = !DILocation(line: 9, column: 5, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 10, column: 14, scope: !9)
!24 = !DILocation(line: 10, column: 21, scope: !9)
!25 = !DILocation(line: 10, column: 27, scope: !9)
!26 = !DILocation(line: 11, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 9)
!28 = !DILocation(line: 11, column: 11, scope: !27)
!29 = !DILocation(line: 11, column: 9, scope: !9)
!30 = !DILocalVariable(name: "b", scope: !31, file: !10, line: 12, type: !13)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 11, column: 17)
!32 = !DILocation(line: 12, column: 13, scope: !31)
!33 = !DILocation(line: 12, column: 17, scope: !31)
!34 = !DILocalVariable(name: "i", scope: !31, file: !10, line: 13, type: !13)
!35 = !DILocation(line: 13, column: 13, scope: !31)
!36 = !DILocation(line: 14, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 14, column: 9)
!38 = !DILocation(line: 14, column: 14, scope: !37)
!39 = !DILocation(line: 14, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 14, column: 9)
!41 = !DILocation(line: 14, column: 23, scope: !40)
!42 = !DILocation(line: 14, column: 9, scope: !37)
!43 = !DILocation(line: 15, column: 14, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 14, column: 33)
!45 = !DILocation(line: 16, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !44, file: !10, line: 16, column: 16)
!47 = !DILocation(line: 16, column: 18, scope: !46)
!48 = !DILocation(line: 16, column: 16, scope: !44)
!49 = !DILocation(line: 17, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !10, line: 16, column: 24)
!51 = !DILocation(line: 19, column: 9, scope: !44)
!52 = !DILocation(line: 14, column: 29, scope: !40)
!53 = !DILocation(line: 14, column: 9, scope: !40)
!54 = distinct !{!54, !42, !55, !56}
!55 = !DILocation(line: 19, column: 9, scope: !37)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 20, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !31, file: !10, line: 20, column: 13)
!59 = !DILocation(line: 20, column: 15, scope: !58)
!60 = !DILocation(line: 20, column: 19, scope: !58)
!61 = !DILocation(line: 20, column: 22, scope: !58)
!62 = !DILocation(line: 20, column: 24, scope: !58)
!63 = !DILocation(line: 20, column: 29, scope: !58)
!64 = !DILocation(line: 20, column: 32, scope: !58)
!65 = !DILocation(line: 20, column: 34, scope: !58)
!66 = !DILocation(line: 20, column: 38, scope: !58)
!67 = !DILocation(line: 20, column: 13, scope: !31)
!68 = !DILocation(line: 22, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !10, line: 22, column: 7)
!70 = distinct !DILexicalBlock(scope: !58, file: !10, line: 20, column: 44)
!71 = !DILocation(line: 22, column: 9, scope: !69)
!72 = !DILocation(line: 22, column: 7, scope: !70)
!73 = !DILocation(line: 23, column: 12, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !10, line: 22, column: 14)
!75 = !DILocation(line: 23, column: 5, scope: !74)
!76 = !DILocation(line: 23, column: 15, scope: !74)
!77 = !DILocation(line: 24, column: 4, scope: !74)
!78 = !DILocation(line: 26, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !69, file: !10, line: 25, column: 9)
!80 = !DILocation(line: 26, column: 16, scope: !79)
!81 = !DILocation(line: 28, column: 9, scope: !70)
!82 = !DILocation(line: 29, column: 5, scope: !31)
!83 = !DILocation(line: 31, column: 10, scope: !84)
!84 = distinct !DILexicalBlock(scope: !27, file: !10, line: 30, column: 7)
!85 = !DILocation(line: 31, column: 3, scope: !84)
!86 = !DILocation(line: 31, column: 13, scope: !84)
!87 = !DILocation(line: 33, column: 1, scope: !9)
