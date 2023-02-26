; ModuleID = 'mac_bc/pass/INTERVAL_test_58.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_58.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"%d is even\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"%d is odd\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %a, align 4, !dbg !19
  %cmp = icmp sge i32 %0, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.end7, !dbg !22

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !23

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32, i32* %a, align 4, !dbg !25
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %1), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !30
  %2 = load i32, i32* %b, align 4, !dbg !31
  store i32 %2, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %do.body
  %3 = load i32, i32* %i, align 4, !dbg !33
  %4 = load i32, i32* %a, align 4, !dbg !35
  %cmp1 = icmp sgt i32 %3, %4, !dbg !36
  br i1 %cmp1, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !38
  %rem = srem i32 %5, 2, !dbg !41
  %cmp2 = icmp eq i32 %rem, 0, !dbg !42
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !43

if.then3:                                         ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !44
  %call4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 noundef %6), !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !48
  %call5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), i32 noundef %7), !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4, !dbg !52
  %dec = add nsw i32 %8, -1, !dbg !52
  store i32 %dec, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %a, align 4, !dbg !57
  %dec6 = add nsw i32 %9, -1, !dbg !57
  store i32 %dec6, i32* %a, align 4, !dbg !57
  br label %do.cond, !dbg !58

do.cond:                                          ; preds = %for.end
  %10 = load i32, i32* %a, align 4, !dbg !59
  %tobool = icmp ne i32 %10, 0, !dbg !58
  br i1 %tobool, label %do.body, label %do.end, !dbg !58, !llvm.loop !60

do.end:                                           ; preds = %do.cond
  br label %if.end7, !dbg !62

if.end7:                                          ; preds = %do.end, %entry
  %11 = load i32, i32* %retval, align 4, !dbg !63
  ret i32 %11, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_58.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_58.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!16 = !DILocation(line: 9, column: 6, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 10, type: !13)
!18 = !DILocation(line: 10, column: 6, scope: !9)
!19 = !DILocation(line: 11, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 5)
!21 = !DILocation(line: 11, column: 7, scope: !20)
!22 = !DILocation(line: 11, column: 5, scope: !9)
!23 = !DILocation(line: 12, column: 3, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 11, column: 13)
!25 = !DILocation(line: 13, column: 22, scope: !26)
!26 = distinct !DILexicalBlock(scope: !24, file: !10, line: 12, column: 6)
!27 = !DILocation(line: 13, column: 7, scope: !26)
!28 = !DILocalVariable(name: "i", scope: !29, file: !10, line: 14, type: !13)
!29 = distinct !DILexicalBlock(scope: !26, file: !10, line: 14, column: 4)
!30 = !DILocation(line: 14, column: 12, scope: !29)
!31 = !DILocation(line: 14, column: 16, scope: !29)
!32 = !DILocation(line: 14, column: 8, scope: !29)
!33 = !DILocation(line: 14, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !10, line: 14, column: 4)
!35 = !DILocation(line: 14, column: 23, scope: !34)
!36 = !DILocation(line: 14, column: 21, scope: !34)
!37 = !DILocation(line: 14, column: 4, scope: !29)
!38 = !DILocation(line: 15, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !10, line: 15, column: 8)
!40 = distinct !DILexicalBlock(scope: !34, file: !10, line: 14, column: 31)
!41 = !DILocation(line: 15, column: 10, scope: !39)
!42 = !DILocation(line: 15, column: 14, scope: !39)
!43 = !DILocation(line: 15, column: 8, scope: !40)
!44 = !DILocation(line: 16, column: 29, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !10, line: 15, column: 20)
!46 = !DILocation(line: 16, column: 6, scope: !45)
!47 = !DILocation(line: 17, column: 5, scope: !45)
!48 = !DILocation(line: 19, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !39, file: !10, line: 18, column: 10)
!50 = !DILocation(line: 19, column: 6, scope: !49)
!51 = !DILocation(line: 21, column: 4, scope: !40)
!52 = !DILocation(line: 14, column: 27, scope: !34)
!53 = !DILocation(line: 14, column: 4, scope: !34)
!54 = distinct !{!54, !37, !55, !56}
!55 = !DILocation(line: 21, column: 4, scope: !29)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 22, column: 5, scope: !26)
!58 = !DILocation(line: 23, column: 3, scope: !26)
!59 = !DILocation(line: 23, column: 11, scope: !24)
!60 = distinct !{!60, !23, !61, !56}
!61 = !DILocation(line: 23, column: 12, scope: !24)
!62 = !DILocation(line: 24, column: 2, scope: !24)
!63 = !DILocation(line: 25, column: 1, scope: !9)
