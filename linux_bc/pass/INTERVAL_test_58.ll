; ModuleID = 'linux_bc/pass/INTERVAL_test_58.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_58.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"%d is even\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"%d is odd\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %a, align 4, !dbg !18
  %cmp = icmp sge i32 %0, 0, !dbg !20
  br i1 %cmp, label %if.then, label %if.end7, !dbg !21

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !22

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32, i32* %a, align 4, !dbg !24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  %2 = load i32, i32* %b, align 4, !dbg !30
  store i32 %2, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %do.body
  %3 = load i32, i32* %i, align 4, !dbg !32
  %4 = load i32, i32* %a, align 4, !dbg !34
  %cmp1 = icmp sgt i32 %3, %4, !dbg !35
  br i1 %cmp1, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !37
  %rem = srem i32 %5, 2, !dbg !40
  %cmp2 = icmp eq i32 %rem, 0, !dbg !41
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !42

if.then3:                                         ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !43
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %6), !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !47
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 %7), !dbg !49
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4, !dbg !51
  %dec = add nsw i32 %8, -1, !dbg !51
  store i32 %dec, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %a, align 4, !dbg !56
  %dec6 = add nsw i32 %9, -1, !dbg !56
  store i32 %dec6, i32* %a, align 4, !dbg !56
  br label %do.cond, !dbg !57

do.cond:                                          ; preds = %for.end
  %10 = load i32, i32* %a, align 4, !dbg !58
  %tobool = icmp ne i32 %10, 0, !dbg !57
  br i1 %tobool, label %do.body, label %do.end, !dbg !57, !llvm.loop !59

do.end:                                           ; preds = %do.cond
  br label %if.end7, !dbg !61

if.end7:                                          ; preds = %do.end, %entry
  %11 = load i32, i32* %retval, align 4, !dbg !62
  ret i32 %11, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_58.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_58.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!15 = !DILocation(line: 9, column: 6, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 10, type: !13)
!17 = !DILocation(line: 10, column: 6, scope: !9)
!18 = !DILocation(line: 11, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 5)
!20 = !DILocation(line: 11, column: 7, scope: !19)
!21 = !DILocation(line: 11, column: 5, scope: !9)
!22 = !DILocation(line: 12, column: 3, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !10, line: 11, column: 13)
!24 = !DILocation(line: 13, column: 22, scope: !25)
!25 = distinct !DILexicalBlock(scope: !23, file: !10, line: 12, column: 6)
!26 = !DILocation(line: 13, column: 7, scope: !25)
!27 = !DILocalVariable(name: "i", scope: !28, file: !10, line: 14, type: !13)
!28 = distinct !DILexicalBlock(scope: !25, file: !10, line: 14, column: 4)
!29 = !DILocation(line: 14, column: 12, scope: !28)
!30 = !DILocation(line: 14, column: 16, scope: !28)
!31 = !DILocation(line: 14, column: 8, scope: !28)
!32 = !DILocation(line: 14, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !10, line: 14, column: 4)
!34 = !DILocation(line: 14, column: 23, scope: !33)
!35 = !DILocation(line: 14, column: 21, scope: !33)
!36 = !DILocation(line: 14, column: 4, scope: !28)
!37 = !DILocation(line: 15, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !10, line: 15, column: 8)
!39 = distinct !DILexicalBlock(scope: !33, file: !10, line: 14, column: 31)
!40 = !DILocation(line: 15, column: 10, scope: !38)
!41 = !DILocation(line: 15, column: 14, scope: !38)
!42 = !DILocation(line: 15, column: 8, scope: !39)
!43 = !DILocation(line: 16, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !10, line: 15, column: 20)
!45 = !DILocation(line: 16, column: 6, scope: !44)
!46 = !DILocation(line: 17, column: 5, scope: !44)
!47 = !DILocation(line: 19, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !38, file: !10, line: 18, column: 10)
!49 = !DILocation(line: 19, column: 6, scope: !48)
!50 = !DILocation(line: 21, column: 4, scope: !39)
!51 = !DILocation(line: 14, column: 27, scope: !33)
!52 = !DILocation(line: 14, column: 4, scope: !33)
!53 = distinct !{!53, !36, !54, !55}
!54 = !DILocation(line: 21, column: 4, scope: !28)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 22, column: 5, scope: !25)
!57 = !DILocation(line: 23, column: 3, scope: !25)
!58 = !DILocation(line: 23, column: 11, scope: !23)
!59 = distinct !{!59, !22, !60, !55}
!60 = !DILocation(line: 23, column: 12, scope: !23)
!61 = !DILocation(line: 24, column: 2, scope: !23)
!62 = !DILocation(line: 25, column: 1, scope: !9)
