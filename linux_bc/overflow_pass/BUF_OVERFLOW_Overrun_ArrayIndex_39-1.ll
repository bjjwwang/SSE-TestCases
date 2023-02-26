; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"%d is even\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"%d is odd\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 11, !dbg !24
  store i32 %rem, i32* %a, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %b, metadata !25, metadata !DIExpression()), !dbg !26
  %call2 = call i32 @rand() #4, !dbg !27
  %rem3 = srem i32 %call2, 11, !dbg !28
  store i32 %rem3, i32* %b, align 4, !dbg !26
  %0 = load i32, i32* %a, align 4, !dbg !29
  %cmp = icmp sge i32 %0, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.end12, !dbg !32

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !33

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32, i32* %a, align 4, !dbg !35
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !DIExpression()), !dbg !40
  %2 = load i32, i32* %b, align 4, !dbg !41
  store i32 %2, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %do.body
  %3 = load i32, i32* %i, align 4, !dbg !43
  %4 = load i32, i32* %a, align 4, !dbg !45
  %cmp5 = icmp sgt i32 %3, %4, !dbg !46
  br i1 %cmp5, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !48
  %rem6 = srem i32 %5, 2, !dbg !51
  %cmp7 = icmp eq i32 %rem6, 0, !dbg !52
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !53

if.then8:                                         ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !54
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %6), !dbg !56
  %7 = load i32, i32* %a, align 4, !dbg !57
  %idxprom = sext i32 %7 to i64, !dbg !58
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !58
  store i32 1, i32* %arrayidx, align 4, !dbg !59
  br label %if.end, !dbg !60

if.else:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !61
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 %8), !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then8
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4, !dbg !65
  %dec = add nsw i32 %9, -1, !dbg !65
  store i32 %dec, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %a, align 4, !dbg !70
  %dec11 = add nsw i32 %10, -1, !dbg !70
  store i32 %dec11, i32* %a, align 4, !dbg !70
  br label %do.cond, !dbg !71

do.cond:                                          ; preds = %for.end
  %11 = load i32, i32* %a, align 4, !dbg !72
  %tobool = icmp ne i32 %11, 0, !dbg !71
  br i1 %tobool, label %do.body, label %do.end, !dbg !71, !llvm.loop !73

do.end:                                           ; preds = %do.cond
  br label %if.end12, !dbg !75

if.end12:                                         ; preds = %do.end, %entry
  %12 = load i32, i32* %a, align 4, !dbg !76
  %idxprom13 = sext i32 %12 to i64, !dbg !77
  %arrayidx14 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !77
  store i32 1, i32* %arrayidx14, align 4, !dbg !78
  %13 = load i32, i32* %retval, align 4, !dbg !79
  ret i32 %13, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 8, scope: !9)
!20 = !DILocation(line: 9, column: 2, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 10, column: 13, scope: !9)
!24 = !DILocation(line: 10, column: 20, scope: !9)
!25 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 11, type: !13)
!26 = !DILocation(line: 11, column: 6, scope: !9)
!27 = !DILocation(line: 11, column: 10, scope: !9)
!28 = !DILocation(line: 11, column: 17, scope: !9)
!29 = !DILocation(line: 12, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 5)
!31 = !DILocation(line: 12, column: 7, scope: !30)
!32 = !DILocation(line: 12, column: 5, scope: !9)
!33 = !DILocation(line: 13, column: 3, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 12, column: 13)
!35 = !DILocation(line: 14, column: 22, scope: !36)
!36 = distinct !DILexicalBlock(scope: !34, file: !10, line: 13, column: 6)
!37 = !DILocation(line: 14, column: 7, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !39, file: !10, line: 15, type: !13)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 15, column: 4)
!40 = !DILocation(line: 15, column: 12, scope: !39)
!41 = !DILocation(line: 15, column: 16, scope: !39)
!42 = !DILocation(line: 15, column: 8, scope: !39)
!43 = !DILocation(line: 15, column: 19, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !10, line: 15, column: 4)
!45 = !DILocation(line: 15, column: 23, scope: !44)
!46 = !DILocation(line: 15, column: 21, scope: !44)
!47 = !DILocation(line: 15, column: 4, scope: !39)
!48 = !DILocation(line: 16, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !10, line: 16, column: 8)
!50 = distinct !DILexicalBlock(scope: !44, file: !10, line: 15, column: 31)
!51 = !DILocation(line: 16, column: 10, scope: !49)
!52 = !DILocation(line: 16, column: 14, scope: !49)
!53 = !DILocation(line: 16, column: 8, scope: !50)
!54 = !DILocation(line: 17, column: 29, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !10, line: 16, column: 20)
!56 = !DILocation(line: 17, column: 6, scope: !55)
!57 = !DILocation(line: 18, column: 13, scope: !55)
!58 = !DILocation(line: 18, column: 6, scope: !55)
!59 = !DILocation(line: 18, column: 16, scope: !55)
!60 = !DILocation(line: 19, column: 5, scope: !55)
!61 = !DILocation(line: 21, column: 28, scope: !62)
!62 = distinct !DILexicalBlock(scope: !49, file: !10, line: 20, column: 10)
!63 = !DILocation(line: 21, column: 6, scope: !62)
!64 = !DILocation(line: 23, column: 4, scope: !50)
!65 = !DILocation(line: 15, column: 27, scope: !44)
!66 = !DILocation(line: 15, column: 4, scope: !44)
!67 = distinct !{!67, !47, !68, !69}
!68 = !DILocation(line: 23, column: 4, scope: !39)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 24, column: 5, scope: !36)
!71 = !DILocation(line: 25, column: 3, scope: !36)
!72 = !DILocation(line: 25, column: 11, scope: !34)
!73 = distinct !{!73, !33, !74, !69}
!74 = !DILocation(line: 25, column: 12, scope: !34)
!75 = !DILocation(line: 26, column: 2, scope: !34)
!76 = !DILocation(line: 28, column: 9, scope: !9)
!77 = !DILocation(line: 28, column: 2, scope: !9)
!78 = !DILocation(line: 28, column: 12, scope: !9)
!79 = !DILocation(line: 29, column: 1, scope: !9)
