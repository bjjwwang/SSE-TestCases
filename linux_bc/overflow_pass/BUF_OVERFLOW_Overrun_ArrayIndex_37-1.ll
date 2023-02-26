; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_37-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_37-1.c"
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %buffer, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !54
  %9 = load i32, i32* %i.addr, align 4, !dbg !55
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %9) #5, !dbg !56
  br label %LOOPENTRY, !dbg !56

LOOPENTRY:                                        ; preds = %LOOP, %while.end
  call void @llvm.dbg.label(metadata !57), !dbg !58
  %10 = load i32, i32* %stackIndex, align 4, !dbg !59
  %cmp2 = icmp ne i32 %10, 0, !dbg !61
  br i1 %cmp2, label %if.then, label %if.else, !dbg !62

if.then:                                          ; preds = %LOOPENTRY
  br label %LOOP, !dbg !63

if.else:                                          ; preds = %LOOPENTRY
  br label %LOOPEXIT, !dbg !65

LOOP:                                             ; preds = %if.then
  call void @llvm.dbg.label(metadata !67), !dbg !68
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !69
  %11 = load i32, i32* %stackIndex, align 4, !dbg !70
  %dec = add nsw i32 %11, -1, !dbg !70
  store i32 %dec, i32* %stackIndex, align 4, !dbg !70
  %idxprom4 = sext i32 %dec to i64, !dbg !71
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %stack, i64 0, i64 %idxprom4, !dbg !71
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !71
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %12) #5, !dbg !72
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !73
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %buffer, i64 0, i64 0, !dbg !74
  %call9 = call i8* @strcat(i8* %arraydecay7, i8* %arraydecay8) #5, !dbg !75
  br label %LOOPENTRY, !dbg !76

LOOPEXIT:                                         ; preds = %if.else
  call void @llvm.dbg.label(metadata !77), !dbg !78
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %result, i64 0, i64 0, !dbg !79
  %call11 = call i32 @atoi(i8* %arraydecay10) #6, !dbg !80
  ret i32 %call11, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !82 {
entry:
  %buffer1 = alloca [37 x i32], align 16
  %buffer2 = alloca [36 x i32], align 16
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [37 x i32]* %buffer1, metadata !85, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [36 x i32]* %buffer2, metadata !90, metadata !DIExpression()), !dbg !94
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !95
  call void @srand(i32 %call) #5, !dbg !96
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !97, metadata !DIExpression()), !dbg !98
  %call1 = call i32 @rand() #5, !dbg !99
  %rem = srem i32 %call1, 31, !dbg !100
  store i32 %rem, i32* %randomNumber, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata i32* %i, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* %randomNumber, align 4, !dbg !103
  %call2 = call i32 @baseConversion(i32 %0, i32 8), !dbg !104
  store i32 %call2, i32* %i, align 4, !dbg !102
  %1 = load i32, i32* %i, align 4, !dbg !105
  %idxprom = sext i32 %1 to i64, !dbg !106
  %arrayidx = getelementptr inbounds [37 x i32], [37 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !106
  store i32 1, i32* %arrayidx, align 4, !dbg !107
  %2 = load i32, i32* %i, align 4, !dbg !108
  %idxprom3 = sext i32 %2 to i64, !dbg !109
  %arrayidx4 = getelementptr inbounds [36 x i32], [36 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !109
  store i32 1, i32* %arrayidx4, align 4, !dbg !110
  ret i32 0, !dbg !111
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_37-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_37-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!52 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 18, type: !47)
!53 = !DILocation(line: 18, column: 10, scope: !9)
!54 = !DILocation(line: 19, column: 13, scope: !9)
!55 = !DILocation(line: 19, column: 27, scope: !9)
!56 = !DILocation(line: 19, column: 5, scope: !9)
!57 = !DILabel(scope: !9, name: "LOOPENTRY", file: !10, line: 20)
!58 = !DILocation(line: 20, column: 5, scope: !9)
!59 = !DILocation(line: 21, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !9, file: !10, line: 21, column: 8)
!61 = !DILocation(line: 21, column: 19, scope: !60)
!62 = !DILocation(line: 21, column: 8, scope: !9)
!63 = !DILocation(line: 22, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 21, column: 25)
!65 = !DILocation(line: 25, column: 9, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !10, line: 24, column: 10)
!67 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 27)
!68 = !DILocation(line: 27, column: 5, scope: !9)
!69 = !DILocation(line: 28, column: 13, scope: !9)
!70 = !DILocation(line: 28, column: 33, scope: !9)
!71 = !DILocation(line: 28, column: 27, scope: !9)
!72 = !DILocation(line: 28, column: 5, scope: !9)
!73 = !DILocation(line: 29, column: 12, scope: !9)
!74 = !DILocation(line: 29, column: 20, scope: !9)
!75 = !DILocation(line: 29, column: 5, scope: !9)
!76 = !DILocation(line: 30, column: 5, scope: !9)
!77 = !DILabel(scope: !9, name: "LOOPEXIT", file: !10, line: 31)
!78 = !DILocation(line: 31, column: 5, scope: !9)
!79 = !DILocation(line: 32, column: 17, scope: !9)
!80 = !DILocation(line: 32, column: 12, scope: !9)
!81 = !DILocation(line: 32, column: 5, scope: !9)
!82 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 35, type: !83, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!13}
!85 = !DILocalVariable(name: "buffer1", scope: !82, file: !10, line: 36, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1184, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 37)
!89 = !DILocation(line: 36, column: 6, scope: !82)
!90 = !DILocalVariable(name: "buffer2", scope: !82, file: !10, line: 37, type: !91)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1152, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 36)
!94 = !DILocation(line: 37, column: 6, scope: !82)
!95 = !DILocation(line: 38, column: 11, scope: !82)
!96 = !DILocation(line: 38, column: 5, scope: !82)
!97 = !DILocalVariable(name: "randomNumber", scope: !82, file: !10, line: 39, type: !13)
!98 = !DILocation(line: 39, column: 9, scope: !82)
!99 = !DILocation(line: 39, column: 24, scope: !82)
!100 = !DILocation(line: 39, column: 31, scope: !82)
!101 = !DILocalVariable(name: "i", scope: !82, file: !10, line: 41, type: !13)
!102 = !DILocation(line: 41, column: 9, scope: !82)
!103 = !DILocation(line: 41, column: 28, scope: !82)
!104 = !DILocation(line: 41, column: 13, scope: !82)
!105 = !DILocation(line: 43, column: 10, scope: !82)
!106 = !DILocation(line: 43, column: 2, scope: !82)
!107 = !DILocation(line: 43, column: 13, scope: !82)
!108 = !DILocation(line: 44, column: 10, scope: !82)
!109 = !DILocation(line: 44, column: 2, scope: !82)
!110 = !DILocation(line: 44, column: 13, scope: !82)
!111 = !DILocation(line: 45, column: 1, scope: !82)
