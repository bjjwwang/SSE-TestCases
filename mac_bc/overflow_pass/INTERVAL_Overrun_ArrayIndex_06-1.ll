; ModuleID = 'mac_bc/overflow_pass/INTERVAL_Overrun_ArrayIndex_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @baseConversion(i32 noundef %i, i32 noundef %base) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %base.addr = alloca i32, align 4
  %stack = alloca [10 x i32], align 16
  %stackIndex = alloca i32, align 4
  %result = alloca [100 x i8], align 16
  %buffer = alloca [100 x i8], align 16
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %base, i32* %base.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %base.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %stack, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %stackIndex, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %stackIndex, align 4, !dbg !25
  br label %while.cond, !dbg !26

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !27
  %1 = load i32, i32* %base.addr, align 4, !dbg !28
  %cmp = icmp sge i32 %0, %1, !dbg !29
  br i1 %cmp, label %while.body, label %while.end, !dbg !26

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %stackIndex, align 4, !dbg !30
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %2), !dbg !32
  %3 = load i32, i32* %i.addr, align 4, !dbg !33
  %4 = load i32, i32* %base.addr, align 4, !dbg !34
  %rem = srem i32 %3, %4, !dbg !35
  %5 = load i32, i32* %stackIndex, align 4, !dbg !36
  %idxprom = sext i32 %5 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %stack, i64 0, i64 %idxprom, !dbg !37
  store i32 %rem, i32* %arrayidx, align 4, !dbg !38
  %6 = load i32, i32* %stackIndex, align 4, !dbg !39
  %inc = add nsw i32 %6, 1, !dbg !39
  store i32 %inc, i32* %stackIndex, align 4, !dbg !39
  %7 = load i32, i32* %i.addr, align 4, !dbg !40
  %8 = load i32, i32* %base.addr, align 4, !dbg !41
  %div = sdiv i32 %7, %8, !dbg !42
  store i32 %div, i32* %i.addr, align 4, !dbg !43
  br label %while.cond, !dbg !26, !llvm.loop !44

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %result, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %buffer, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !55
  %9 = load i32, i32* %i.addr, align 4, !dbg !55
  %call1 = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %arraydecay, i32 noundef 0, i64 noundef 100, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %9), !dbg !55
  br label %LOOPENTRY, !dbg !55

LOOPENTRY:                                        ; preds = %LOOP, %while.end
  call void @llvm.dbg.label(metadata !56), !dbg !57
  %10 = load i32, i32* %stackIndex, align 4, !dbg !58
  %cmp2 = icmp ne i32 %10, 0, !dbg !60
  br i1 %cmp2, label %if.then, label %if.else, !dbg !61

if.then:                                          ; preds = %LOOPENTRY
  br label %LOOP, !dbg !62

if.else:                                          ; preds = %LOOPENTRY
  br label %LOOPEXIT, !dbg !64

LOOP:                                             ; preds = %if.then
  call void @llvm.dbg.label(metadata !66), !dbg !67
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !68
  %11 = load i32, i32* %stackIndex, align 4, !dbg !68
  %dec = add nsw i32 %11, -1, !dbg !68
  store i32 %dec, i32* %stackIndex, align 4, !dbg !68
  %idxprom4 = sext i32 %dec to i64, !dbg !68
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %stack, i64 0, i64 %idxprom4, !dbg !68
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !68
  %call6 = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %arraydecay3, i32 noundef 0, i64 noundef 100, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %12), !dbg !68
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !69
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !69
  %call9 = call i8* @__strcat_chk(i8* noundef %arraydecay7, i8* noundef %arraydecay8, i64 noundef 100) #4, !dbg !69
  br label %LOOPENTRY, !dbg !70

LOOPEXIT:                                         ; preds = %if.else
  call void @llvm.dbg.label(metadata !71), !dbg !72
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !73
  %call11 = call i32 @atoi(i8* noundef %arraydecay10), !dbg !74
  ret i32 %call11, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__sprintf_chk(i8* noundef, i32 noundef, i64 noundef, i8* noundef, ...) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #3

declare i32 @atoi(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !79
  call void @srand(i32 noundef %call), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !81, metadata !DIExpression()), !dbg !82
  %call1 = call i32 @rand(), !dbg !83
  %rem = srem i32 %call1, 31, !dbg !84
  store i32 %rem, i32* %randomNumber, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %i, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = load i32, i32* %randomNumber, align 4, !dbg !87
  %call2 = call i32 @baseConversion(i32 noundef %0, i32 noundef 8), !dbg !88
  store i32 %call2, i32* %i, align 4, !dbg !86
  %1 = load i32, i32* %i, align 4, !dbg !89
  %cmp = icmp sge i32 %1, 0, !dbg !90
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !91

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !92
  %cmp3 = icmp sle i32 %2, 36, !dbg !93
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !94
  call void @svf_assert(i1 noundef zeroext %3), !dbg !95
  %4 = load i32, i32* %retval, align 4, !dbg !96
  ret i32 %4, !dbg !96
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/INTERVAL_Overrun_ArrayIndex_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 24, scope: !9)
!17 = !DILocalVariable(name: "base", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 31, scope: !9)
!19 = !DILocalVariable(name: "stack", scope: !9, file: !10, line: 9, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 9, column: 9, scope: !9)
!24 = !DILocalVariable(name: "stackIndex", scope: !9, file: !10, line: 10, type: !13)
!25 = !DILocation(line: 10, column: 9, scope: !9)
!26 = !DILocation(line: 11, column: 5, scope: !9)
!27 = !DILocation(line: 11, column: 11, scope: !9)
!28 = !DILocation(line: 11, column: 16, scope: !9)
!29 = !DILocation(line: 11, column: 13, scope: !9)
!30 = !DILocation(line: 12, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 22)
!32 = !DILocation(line: 12, column: 9, scope: !31)
!33 = !DILocation(line: 13, column: 29, scope: !31)
!34 = !DILocation(line: 13, column: 33, scope: !31)
!35 = !DILocation(line: 13, column: 31, scope: !31)
!36 = !DILocation(line: 13, column: 15, scope: !31)
!37 = !DILocation(line: 13, column: 9, scope: !31)
!38 = !DILocation(line: 13, column: 27, scope: !31)
!39 = !DILocation(line: 14, column: 19, scope: !31)
!40 = !DILocation(line: 15, column: 13, scope: !31)
!41 = !DILocation(line: 15, column: 17, scope: !31)
!42 = !DILocation(line: 15, column: 15, scope: !31)
!43 = !DILocation(line: 15, column: 11, scope: !31)
!44 = distinct !{!44, !26, !45, !46}
!45 = !DILocation(line: 17, column: 5, scope: !9)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 18, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 800, elements: !50)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 18, column: 10, scope: !9)
!53 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 19, type: !48)
!54 = !DILocation(line: 19, column: 10, scope: !9)
!55 = !DILocation(line: 20, column: 5, scope: !9)
!56 = !DILabel(scope: !9, name: "LOOPENTRY", file: !10, line: 21)
!57 = !DILocation(line: 21, column: 5, scope: !9)
!58 = !DILocation(line: 22, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !9, file: !10, line: 22, column: 8)
!60 = !DILocation(line: 22, column: 19, scope: !59)
!61 = !DILocation(line: 22, column: 8, scope: !9)
!62 = !DILocation(line: 23, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 22, column: 25)
!64 = !DILocation(line: 26, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !10, line: 25, column: 10)
!66 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 28)
!67 = !DILocation(line: 28, column: 5, scope: !9)
!68 = !DILocation(line: 29, column: 5, scope: !9)
!69 = !DILocation(line: 30, column: 5, scope: !9)
!70 = !DILocation(line: 31, column: 5, scope: !9)
!71 = !DILabel(scope: !9, name: "LOOPEXIT", file: !10, line: 32)
!72 = !DILocation(line: 32, column: 5, scope: !9)
!73 = !DILocation(line: 33, column: 17, scope: !9)
!74 = !DILocation(line: 33, column: 12, scope: !9)
!75 = !DILocation(line: 33, column: 5, scope: !9)
!76 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 36, type: !77, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!77 = !DISubroutineType(types: !78)
!78 = !{!13}
!79 = !DILocation(line: 37, column: 11, scope: !76)
!80 = !DILocation(line: 37, column: 5, scope: !76)
!81 = !DILocalVariable(name: "randomNumber", scope: !76, file: !10, line: 38, type: !13)
!82 = !DILocation(line: 38, column: 9, scope: !76)
!83 = !DILocation(line: 38, column: 24, scope: !76)
!84 = !DILocation(line: 38, column: 31, scope: !76)
!85 = !DILocalVariable(name: "i", scope: !76, file: !10, line: 40, type: !13)
!86 = !DILocation(line: 40, column: 9, scope: !76)
!87 = !DILocation(line: 40, column: 28, scope: !76)
!88 = !DILocation(line: 40, column: 13, scope: !76)
!89 = !DILocation(line: 41, column: 16, scope: !76)
!90 = !DILocation(line: 41, column: 18, scope: !76)
!91 = !DILocation(line: 41, column: 23, scope: !76)
!92 = !DILocation(line: 41, column: 26, scope: !76)
!93 = !DILocation(line: 41, column: 28, scope: !76)
!94 = !DILocation(line: 0, scope: !76)
!95 = !DILocation(line: 41, column: 5, scope: !76)
!96 = !DILocation(line: 42, column: 1, scope: !76)
