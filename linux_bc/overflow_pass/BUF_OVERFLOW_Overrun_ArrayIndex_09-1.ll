; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_09-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_09-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #5, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #5, !dbg !23
  %rem = srem i32 %call1, 11, !dbg !24
  store i32 %rem, i32* %a, align 4, !dbg !22
  br label %while.body, !dbg !25

while.body:                                       ; preds = %if.end8, %entry
  %0 = load i32, i32* %a, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %while.body
  call void @exit(i32 0) #6, !dbg !30
  unreachable, !dbg !30

if.else:                                          ; preds = %while.body
  %1 = load i32, i32* %a, align 4, !dbg !32
  %cmp = icmp sgt i32 %1, 0, !dbg !35
  br i1 %cmp, label %if.then2, label %if.else3, !dbg !36

if.then2:                                         ; preds = %if.else
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 20, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !39
  %2 = load i32, i32* %a, align 4, !dbg !40
  %dec = add nsw i32 %2, -1, !dbg !40
  store i32 %dec, i32* %a, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else3:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !42
  %inc = add nsw i32 %3, 1, !dbg !42
  store i32 %inc, i32* %a, align 4, !dbg !42
  %4 = load i32, i32* %a, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !45
  %arrayidx4 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  store i32 1, i32* %arrayidx4, align 4, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %5 = load i32, i32* %a, align 4, !dbg !47
  %tobool5 = icmp ne i32 %5, 0, !dbg !47
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !49

if.then6:                                         ; preds = %if.end
  %arrayidx7 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 20, !dbg !50
  store i32 1, i32* %arrayidx7, align 4, !dbg !52
  br label %if.end8, !dbg !53

if.end8:                                          ; preds = %if.then6, %if.end
  br label %while.body, !dbg !54, !llvm.loop !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_09-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_09-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 2)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 8, scope: !9)
!20 = !DILocation(line: 9, column: 2, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 10, column: 13, scope: !9)
!24 = !DILocation(line: 10, column: 20, scope: !9)
!25 = !DILocation(line: 12, column: 2, scope: !9)
!26 = !DILocation(line: 13, column: 6, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !10, line: 13, column: 6)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 14)
!29 = !DILocation(line: 13, column: 6, scope: !28)
!30 = !DILocation(line: 15, column: 4, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 13, column: 9)
!32 = !DILocation(line: 20, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !10, line: 20, column: 7)
!34 = distinct !DILexicalBlock(scope: !27, file: !10, line: 18, column: 8)
!35 = !DILocation(line: 20, column: 9, scope: !33)
!36 = !DILocation(line: 20, column: 7, scope: !34)
!37 = !DILocation(line: 21, column: 5, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !10, line: 20, column: 14)
!39 = !DILocation(line: 21, column: 16, scope: !38)
!40 = !DILocation(line: 22, column: 6, scope: !38)
!41 = !DILocation(line: 23, column: 4, scope: !38)
!42 = !DILocation(line: 25, column: 6, scope: !43)
!43 = distinct !DILexicalBlock(scope: !33, file: !10, line: 24, column: 9)
!44 = !DILocation(line: 27, column: 12, scope: !43)
!45 = !DILocation(line: 27, column: 5, scope: !43)
!46 = !DILocation(line: 27, column: 15, scope: !43)
!47 = !DILocation(line: 29, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !10, line: 29, column: 7)
!49 = !DILocation(line: 29, column: 7, scope: !34)
!50 = !DILocation(line: 30, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 29, column: 10)
!52 = !DILocation(line: 30, column: 16, scope: !51)
!53 = !DILocation(line: 31, column: 4, scope: !51)
!54 = !DILocation(line: 32, column: 4, scope: !34)
!55 = distinct !{!55, !25, !56}
!56 = !DILocation(line: 34, column: 2, scope: !9)
