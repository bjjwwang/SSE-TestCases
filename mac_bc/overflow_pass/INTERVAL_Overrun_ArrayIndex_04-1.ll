; ModuleID = 'mac_bc/overflow_pass/INTERVAL_Overrun_ArrayIndex_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_04-1.c"
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
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !53
  %9 = load i32, i32* %i.addr, align 4, !dbg !53
  %call1 = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %arraydecay, i32 noundef 0, i64 noundef 100, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %9), !dbg !53
  br label %while.cond2, !dbg !54

while.cond2:                                      ; preds = %while.body4, %while.end
  %10 = load i32, i32* %stackIndex, align 4, !dbg !55
  %cmp3 = icmp ne i32 %10, 0, !dbg !56
  br i1 %cmp3, label %while.body4, label %while.end12, !dbg !54

while.body4:                                      ; preds = %while.cond2
  call void @llvm.dbg.declare(metadata [100 x i8]* %buffer, metadata !57, metadata !DIExpression()), !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !60
  %11 = load i32, i32* %stackIndex, align 4, !dbg !60
  %dec = add nsw i32 %11, -1, !dbg !60
  store i32 %dec, i32* %stackIndex, align 4, !dbg !60
  %idxprom6 = sext i32 %dec to i64, !dbg !60
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %stack, i64 0, i64 %idxprom6, !dbg !60
  %12 = load i32, i32* %arrayidx7, align 4, !dbg !60
  %call8 = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %arraydecay5, i32 noundef 0, i64 noundef 100, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %12), !dbg !60
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !61
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !61
  %call11 = call i8* @__strcat_chk(i8* noundef %arraydecay9, i8* noundef %arraydecay10, i64 noundef 100) #4, !dbg !61
  br label %while.cond2, !dbg !54, !llvm.loop !62

while.end12:                                      ; preds = %while.cond2
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !64
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !65
  ret i32 %call14, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__sprintf_chk(i8* noundef, i32 noundef, i64 noundef, i8* noundef, ...) #2

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #3

declare i32 @atoi(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !70
  call void @srand(i32 noundef %call), !dbg !71
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !72, metadata !DIExpression()), !dbg !73
  %call1 = call i32 @rand(), !dbg !74
  %rem = srem i32 %call1, 31, !dbg !75
  store i32 %rem, i32* %randomNumber, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %i, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* %randomNumber, align 4, !dbg !78
  %call2 = call i32 @baseConversion(i32 noundef %0, i32 noundef 8), !dbg !79
  store i32 %call2, i32* %i, align 4, !dbg !77
  %1 = load i32, i32* %i, align 4, !dbg !80
  %cmp = icmp sge i32 %1, 0, !dbg !81
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !82

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !83
  %cmp3 = icmp sle i32 %2, 36, !dbg !84
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !85
  call void @svf_assert(i1 noundef zeroext %3), !dbg !86
  %4 = load i32, i32* %retval, align 4, !dbg !87
  ret i32 %4, !dbg !87
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/INTERVAL_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!53 = !DILocation(line: 19, column: 5, scope: !9)
!54 = !DILocation(line: 20, column: 5, scope: !9)
!55 = !DILocation(line: 20, column: 11, scope: !9)
!56 = !DILocation(line: 20, column: 22, scope: !9)
!57 = !DILocalVariable(name: "buffer", scope: !58, file: !10, line: 21, type: !48)
!58 = distinct !DILexicalBlock(scope: !9, file: !10, line: 20, column: 28)
!59 = !DILocation(line: 21, column: 14, scope: !58)
!60 = !DILocation(line: 22, column: 9, scope: !58)
!61 = !DILocation(line: 23, column: 9, scope: !58)
!62 = distinct !{!62, !54, !63, !46}
!63 = !DILocation(line: 24, column: 5, scope: !9)
!64 = !DILocation(line: 25, column: 17, scope: !9)
!65 = !DILocation(line: 25, column: 12, scope: !9)
!66 = !DILocation(line: 25, column: 5, scope: !9)
!67 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 28, type: !68, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!68 = !DISubroutineType(types: !69)
!69 = !{!13}
!70 = !DILocation(line: 29, column: 11, scope: !67)
!71 = !DILocation(line: 29, column: 5, scope: !67)
!72 = !DILocalVariable(name: "randomNumber", scope: !67, file: !10, line: 30, type: !13)
!73 = !DILocation(line: 30, column: 9, scope: !67)
!74 = !DILocation(line: 30, column: 24, scope: !67)
!75 = !DILocation(line: 30, column: 31, scope: !67)
!76 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 32, type: !13)
!77 = !DILocation(line: 32, column: 9, scope: !67)
!78 = !DILocation(line: 32, column: 28, scope: !67)
!79 = !DILocation(line: 32, column: 13, scope: !67)
!80 = !DILocation(line: 33, column: 16, scope: !67)
!81 = !DILocation(line: 33, column: 18, scope: !67)
!82 = !DILocation(line: 33, column: 23, scope: !67)
!83 = !DILocation(line: 33, column: 26, scope: !67)
!84 = !DILocation(line: 33, column: 28, scope: !67)
!85 = !DILocation(line: 0, scope: !67)
!86 = !DILocation(line: 33, column: 5, scope: !67)
!87 = !DILocation(line: 34, column: 1, scope: !67)
