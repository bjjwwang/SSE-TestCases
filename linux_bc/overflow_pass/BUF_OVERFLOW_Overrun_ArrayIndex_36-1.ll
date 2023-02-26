; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_36-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_36-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @baseConversion(i32 %i, i32 %base) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %base.addr = alloca i32, align 4
  %stack = alloca [10 x i32], align 16
  %stackIndex = alloca i32, align 4
  %result = alloca [100 x i8], align 16
  %buffer = alloca [100 x i8], align 16
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %base, i32* %base.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %base.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [10 x i32]* %stack, metadata !18, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %stackIndex, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %stackIndex, align 4, !dbg !24
  br label %while.cond, !dbg !25

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !26
  %1 = load i32, i32* %base.addr, align 4, !dbg !27
  %cmp = icmp sge i32 %0, %1, !dbg !28
  br i1 %cmp, label %while.body, label %while.end, !dbg !25

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %stackIndex, align 4, !dbg !29
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2), !dbg !31
  %3 = load i32, i32* %i.addr, align 4, !dbg !32
  %4 = load i32, i32* %base.addr, align 4, !dbg !33
  %rem = srem i32 %3, %4, !dbg !34
  %5 = load i32, i32* %stackIndex, align 4, !dbg !35
  %idxprom = sext i32 %5 to i64, !dbg !36
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %stack, i64 0, i64 %idxprom, !dbg !36
  store i32 %rem, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32, i32* %stackIndex, align 4, !dbg !38
  %inc = add nsw i32 %6, 1, !dbg !38
  store i32 %inc, i32* %stackIndex, align 4, !dbg !38
  %7 = load i32, i32* %i.addr, align 4, !dbg !39
  %8 = load i32, i32* %base.addr, align 4, !dbg !40
  %div = sdiv i32 %7, %8, !dbg !41
  store i32 %div, i32* %i.addr, align 4, !dbg !42
  br label %while.cond, !dbg !25, !llvm.loop !43

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %result, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !52
  %9 = load i32, i32* %i.addr, align 4, !dbg !53
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %9) #5, !dbg !54
  br label %while.body3, !dbg !55

while.body3:                                      ; preds = %if.end, %while.end
  %10 = load i32, i32* %stackIndex, align 4, !dbg !56
  %cmp4 = icmp eq i32 %10, 0, !dbg !59
  br i1 %cmp4, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %while.body3
  br label %while.end12, !dbg !61

if.end:                                           ; preds = %while.body3
  call void @llvm.dbg.declare(metadata [100 x i8]* %buffer, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !65
  %11 = load i32, i32* %stackIndex, align 4, !dbg !66
  %dec = add nsw i32 %11, -1, !dbg !66
  store i32 %dec, i32* %stackIndex, align 4, !dbg !66
  %idxprom6 = sext i32 %dec to i64, !dbg !67
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %stack, i64 0, i64 %idxprom6, !dbg !67
  %12 = load i32, i32* %arrayidx7, align 4, !dbg !67
  %call8 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %12) #5, !dbg !68
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !69
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !70
  %call11 = call i8* @strcat(i8* %arraydecay9, i8* %arraydecay10) #5, !dbg !71
  br label %while.body3, !dbg !55, !llvm.loop !72

while.end12:                                      ; preds = %if.then
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !74
  %call14 = call i32 @atoi(i8* %arraydecay13) #6, !dbg !75
  ret i32 %call14, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !77 {
entry:
  %buffer1 = alloca [37 x i32], align 16
  %buffer2 = alloca [36 x i32], align 16
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [37 x i32]* %buffer1, metadata !80, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [36 x i32]* %buffer2, metadata !85, metadata !DIExpression()), !dbg !89
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !90
  call void @srand(i32 %call) #5, !dbg !91
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !92, metadata !DIExpression()), !dbg !93
  %call1 = call i32 @rand() #5, !dbg !94
  %rem = srem i32 %call1, 31, !dbg !95
  store i32 %rem, i32* %randomNumber, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* %randomNumber, align 4, !dbg !98
  %call2 = call i32 @baseConversion(i32 %0, i32 8), !dbg !99
  store i32 %call2, i32* %i, align 4, !dbg !97
  %1 = load i32, i32* %i, align 4, !dbg !100
  %idxprom = sext i32 %1 to i64, !dbg !101
  %arrayidx = getelementptr inbounds [37 x i32], [37 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !101
  store i32 1, i32* %arrayidx, align 4, !dbg !102
  %2 = load i32, i32* %i, align 4, !dbg !103
  %idxprom3 = sext i32 %2 to i64, !dbg !104
  %arrayidx4 = getelementptr inbounds [36 x i32], [36 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !104
  store i32 1, i32* %arrayidx4, align 4, !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

declare dso_local i32 @time(...) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_36-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_36-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 24, scope: !9)
!16 = !DILocalVariable(name: "base", arg: 2, scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 31, scope: !9)
!18 = !DILocalVariable(name: "stack", scope: !9, file: !10, line: 8, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 8, column: 9, scope: !9)
!23 = !DILocalVariable(name: "stackIndex", scope: !9, file: !10, line: 9, type: !13)
!24 = !DILocation(line: 9, column: 9, scope: !9)
!25 = !DILocation(line: 10, column: 5, scope: !9)
!26 = !DILocation(line: 10, column: 11, scope: !9)
!27 = !DILocation(line: 10, column: 16, scope: !9)
!28 = !DILocation(line: 10, column: 13, scope: !9)
!29 = !DILocation(line: 11, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 22)
!31 = !DILocation(line: 11, column: 9, scope: !30)
!32 = !DILocation(line: 12, column: 29, scope: !30)
!33 = !DILocation(line: 12, column: 33, scope: !30)
!34 = !DILocation(line: 12, column: 31, scope: !30)
!35 = !DILocation(line: 12, column: 15, scope: !30)
!36 = !DILocation(line: 12, column: 9, scope: !30)
!37 = !DILocation(line: 12, column: 27, scope: !30)
!38 = !DILocation(line: 13, column: 19, scope: !30)
!39 = !DILocation(line: 14, column: 13, scope: !30)
!40 = !DILocation(line: 14, column: 17, scope: !30)
!41 = !DILocation(line: 14, column: 15, scope: !30)
!42 = !DILocation(line: 14, column: 11, scope: !30)
!43 = distinct !{!43, !25, !44, !45}
!44 = !DILocation(line: 16, column: 5, scope: !9)
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 17, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 800, elements: !49)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 17, column: 10, scope: !9)
!52 = !DILocation(line: 18, column: 13, scope: !9)
!53 = !DILocation(line: 18, column: 27, scope: !9)
!54 = !DILocation(line: 18, column: 5, scope: !9)
!55 = !DILocation(line: 19, column: 5, scope: !9)
!56 = !DILocation(line: 20, column: 12, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !10, line: 20, column: 12)
!58 = distinct !DILexicalBlock(scope: !9, file: !10, line: 19, column: 17)
!59 = !DILocation(line: 20, column: 23, scope: !57)
!60 = !DILocation(line: 20, column: 12, scope: !58)
!61 = !DILocation(line: 21, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !10, line: 20, column: 29)
!63 = !DILocalVariable(name: "buffer", scope: !58, file: !10, line: 23, type: !47)
!64 = !DILocation(line: 23, column: 14, scope: !58)
!65 = !DILocation(line: 24, column: 17, scope: !58)
!66 = !DILocation(line: 24, column: 37, scope: !58)
!67 = !DILocation(line: 24, column: 31, scope: !58)
!68 = !DILocation(line: 24, column: 9, scope: !58)
!69 = !DILocation(line: 25, column: 16, scope: !58)
!70 = !DILocation(line: 25, column: 24, scope: !58)
!71 = !DILocation(line: 25, column: 9, scope: !58)
!72 = distinct !{!72, !55, !73}
!73 = !DILocation(line: 26, column: 5, scope: !9)
!74 = !DILocation(line: 27, column: 17, scope: !9)
!75 = !DILocation(line: 27, column: 12, scope: !9)
!76 = !DILocation(line: 27, column: 5, scope: !9)
!77 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 30, type: !78, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!13}
!80 = !DILocalVariable(name: "buffer1", scope: !77, file: !10, line: 31, type: !81)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1184, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 37)
!84 = !DILocation(line: 31, column: 6, scope: !77)
!85 = !DILocalVariable(name: "buffer2", scope: !77, file: !10, line: 32, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1152, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 36)
!89 = !DILocation(line: 32, column: 6, scope: !77)
!90 = !DILocation(line: 33, column: 11, scope: !77)
!91 = !DILocation(line: 33, column: 5, scope: !77)
!92 = !DILocalVariable(name: "randomNumber", scope: !77, file: !10, line: 34, type: !13)
!93 = !DILocation(line: 34, column: 9, scope: !77)
!94 = !DILocation(line: 34, column: 24, scope: !77)
!95 = !DILocation(line: 34, column: 31, scope: !77)
!96 = !DILocalVariable(name: "i", scope: !77, file: !10, line: 36, type: !13)
!97 = !DILocation(line: 36, column: 9, scope: !77)
!98 = !DILocation(line: 36, column: 28, scope: !77)
!99 = !DILocation(line: 36, column: 13, scope: !77)
!100 = !DILocation(line: 38, column: 10, scope: !77)
!101 = !DILocation(line: 38, column: 2, scope: !77)
!102 = !DILocation(line: 38, column: 13, scope: !77)
!103 = !DILocation(line: 39, column: 10, scope: !77)
!104 = !DILocation(line: 39, column: 2, scope: !77)
!105 = !DILocation(line: 39, column: 13, scope: !77)
!106 = !DILocation(line: 40, column: 1, scope: !77)
