; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"%d is even\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"%d is odd\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 11, !dbg !25
  store i32 %rem, i32* %a, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %b, metadata !26, metadata !DIExpression()), !dbg !27
  %call2 = call i32 @rand(), !dbg !28
  %rem3 = srem i32 %call2, 11, !dbg !29
  store i32 %rem3, i32* %b, align 4, !dbg !27
  %0 = load i32, i32* %a, align 4, !dbg !30
  %cmp = icmp sge i32 %0, 0, !dbg !32
  br i1 %cmp, label %if.then, label %if.end12, !dbg !33

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !34

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32, i32* %a, align 4, !dbg !36
  %call4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %1), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %i, metadata !39, metadata !DIExpression()), !dbg !41
  %2 = load i32, i32* %b, align 4, !dbg !42
  store i32 %2, i32* %i, align 4, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %do.body
  %3 = load i32, i32* %i, align 4, !dbg !44
  %4 = load i32, i32* %a, align 4, !dbg !46
  %cmp5 = icmp sgt i32 %3, %4, !dbg !47
  br i1 %cmp5, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !49
  %rem6 = srem i32 %5, 2, !dbg !52
  %cmp7 = icmp eq i32 %rem6, 0, !dbg !53
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !54

if.then8:                                         ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !55
  %call9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 noundef %6), !dbg !57
  %7 = load i32, i32* %a, align 4, !dbg !58
  %idxprom = sext i32 %7 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  store i32 1, i32* %arrayidx, align 4, !dbg !60
  br label %if.end, !dbg !61

if.else:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !62
  %call10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 noundef %8), !dbg !64
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then8
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4, !dbg !66
  %dec = add nsw i32 %9, -1, !dbg !66
  store i32 %dec, i32* %i, align 4, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %a, align 4, !dbg !71
  %dec11 = add nsw i32 %10, -1, !dbg !71
  store i32 %dec11, i32* %a, align 4, !dbg !71
  br label %do.cond, !dbg !72

do.cond:                                          ; preds = %for.end
  %11 = load i32, i32* %a, align 4, !dbg !73
  %tobool = icmp ne i32 %11, 0, !dbg !72
  br i1 %tobool, label %do.body, label %do.end, !dbg !72, !llvm.loop !74

do.end:                                           ; preds = %do.cond
  br label %if.end12, !dbg !76

if.end12:                                         ; preds = %do.end, %entry
  %12 = load i32, i32* %a, align 4, !dbg !77
  %idxprom13 = sext i32 %12 to i64, !dbg !78
  %arrayidx14 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom13, !dbg !78
  store i32 1, i32* %arrayidx14, align 4, !dbg !79
  %13 = load i32, i32* %retval, align 4, !dbg !80
  ret i32 %13, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_39-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 5)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocation(line: 9, column: 8, scope: !9)
!21 = !DILocation(line: 9, column: 2, scope: !9)
!22 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocation(line: 10, column: 13, scope: !9)
!25 = !DILocation(line: 10, column: 20, scope: !9)
!26 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 11, type: !13)
!27 = !DILocation(line: 11, column: 6, scope: !9)
!28 = !DILocation(line: 11, column: 10, scope: !9)
!29 = !DILocation(line: 11, column: 17, scope: !9)
!30 = !DILocation(line: 12, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 5)
!32 = !DILocation(line: 12, column: 7, scope: !31)
!33 = !DILocation(line: 12, column: 5, scope: !9)
!34 = !DILocation(line: 13, column: 3, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 12, column: 13)
!36 = !DILocation(line: 14, column: 22, scope: !37)
!37 = distinct !DILexicalBlock(scope: !35, file: !10, line: 13, column: 6)
!38 = !DILocation(line: 14, column: 7, scope: !37)
!39 = !DILocalVariable(name: "i", scope: !40, file: !10, line: 15, type: !13)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 15, column: 4)
!41 = !DILocation(line: 15, column: 12, scope: !40)
!42 = !DILocation(line: 15, column: 16, scope: !40)
!43 = !DILocation(line: 15, column: 8, scope: !40)
!44 = !DILocation(line: 15, column: 19, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !10, line: 15, column: 4)
!46 = !DILocation(line: 15, column: 23, scope: !45)
!47 = !DILocation(line: 15, column: 21, scope: !45)
!48 = !DILocation(line: 15, column: 4, scope: !40)
!49 = !DILocation(line: 16, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !10, line: 16, column: 8)
!51 = distinct !DILexicalBlock(scope: !45, file: !10, line: 15, column: 31)
!52 = !DILocation(line: 16, column: 10, scope: !50)
!53 = !DILocation(line: 16, column: 14, scope: !50)
!54 = !DILocation(line: 16, column: 8, scope: !51)
!55 = !DILocation(line: 17, column: 29, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !10, line: 16, column: 20)
!57 = !DILocation(line: 17, column: 6, scope: !56)
!58 = !DILocation(line: 18, column: 13, scope: !56)
!59 = !DILocation(line: 18, column: 6, scope: !56)
!60 = !DILocation(line: 18, column: 16, scope: !56)
!61 = !DILocation(line: 19, column: 5, scope: !56)
!62 = !DILocation(line: 21, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !50, file: !10, line: 20, column: 10)
!64 = !DILocation(line: 21, column: 6, scope: !63)
!65 = !DILocation(line: 23, column: 4, scope: !51)
!66 = !DILocation(line: 15, column: 27, scope: !45)
!67 = !DILocation(line: 15, column: 4, scope: !45)
!68 = distinct !{!68, !48, !69, !70}
!69 = !DILocation(line: 23, column: 4, scope: !40)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 24, column: 5, scope: !37)
!72 = !DILocation(line: 25, column: 3, scope: !37)
!73 = !DILocation(line: 25, column: 11, scope: !35)
!74 = distinct !{!74, !34, !75, !70}
!75 = !DILocation(line: 25, column: 12, scope: !35)
!76 = !DILocation(line: 26, column: 2, scope: !35)
!77 = !DILocation(line: 28, column: 9, scope: !9)
!78 = !DILocation(line: 28, column: 2, scope: !9)
!79 = !DILocation(line: 28, column: 12, scope: !9)
!80 = !DILocation(line: 29, column: 1, scope: !9)
