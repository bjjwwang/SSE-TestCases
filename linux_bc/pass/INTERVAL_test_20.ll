; ModuleID = 'linux_bc/pass/INTERVAL_test_20.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_20.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  %a = alloca i8, align 1
  %a_as_int = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !16
  call void @srand(i32 %call) #4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %r, metadata !18, metadata !DIExpression()), !dbg !19
  %call1 = call i32 @rand() #4, !dbg !20
  %rem = srem i32 %call1, 128, !dbg !21
  store i32 %rem, i32* %r, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i8* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* %r, align 4, !dbg !24
  %conv = trunc i32 %0 to i8, !dbg !25
  store i8 %conv, i8* %a, align 1, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %a_as_int, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = load i8, i8* %a, align 1, !dbg !28
  %conv2 = sext i8 %1 to i32, !dbg !29
  store i32 %conv2, i32* %a_as_int, align 4, !dbg !27
  %2 = load i8, i8* %a, align 1, !dbg !30
  %conv3 = sext i8 %2 to i32, !dbg !30
  %cmp = icmp sge i32 %conv3, 97, !dbg !32
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !33

land.lhs.true:                                    ; preds = %entry
  %3 = load i8, i8* %a, align 1, !dbg !34
  %conv5 = sext i8 %3 to i32, !dbg !34
  %cmp6 = icmp sle i32 %conv5, 122, !dbg !35
  br i1 %cmp6, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %a_as_int, align 4, !dbg !37
  %cmp8 = icmp sge i32 %4, 97, !dbg !39
  br i1 %cmp8, label %land.rhs, label %land.end, !dbg !40

land.rhs:                                         ; preds = %if.then
  %5 = load i32, i32* %a_as_int, align 4, !dbg !41
  %cmp10 = icmp sle i32 %5, 122, !dbg !42
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %6 = phi i1 [ false, %if.then ], [ %cmp10, %land.rhs ], !dbg !43
  call void @svf_assert(i1 zeroext %6), !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %land.end, %land.lhs.true, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !46
  ret i32 %7, !dbg !46
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

declare dso_local i32 @time(...) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_20.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/pass/INTERVAL_test_20.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!5}
!16 = !DILocation(line: 8, column: 11, scope: !12)
!17 = !DILocation(line: 8, column: 5, scope: !12)
!18 = !DILocalVariable(name: "r", scope: !12, file: !13, line: 9, type: !5)
!19 = !DILocation(line: 9, column: 6, scope: !12)
!20 = !DILocation(line: 9, column: 10, scope: !12)
!21 = !DILocation(line: 9, column: 17, scope: !12)
!22 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 10, type: !4)
!23 = !DILocation(line: 10, column: 10, scope: !12)
!24 = !DILocation(line: 10, column: 20, scope: !12)
!25 = !DILocation(line: 10, column: 14, scope: !12)
!26 = !DILocalVariable(name: "a_as_int", scope: !12, file: !13, line: 11, type: !5)
!27 = !DILocation(line: 11, column: 9, scope: !12)
!28 = !DILocation(line: 11, column: 25, scope: !12)
!29 = !DILocation(line: 11, column: 20, scope: !12)
!30 = !DILocation(line: 12, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !12, file: !13, line: 12, column: 9)
!32 = !DILocation(line: 12, column: 11, scope: !31)
!33 = !DILocation(line: 12, column: 18, scope: !31)
!34 = !DILocation(line: 12, column: 21, scope: !31)
!35 = !DILocation(line: 12, column: 23, scope: !31)
!36 = !DILocation(line: 12, column: 9, scope: !12)
!37 = !DILocation(line: 13, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !13, line: 12, column: 31)
!39 = !DILocation(line: 13, column: 29, scope: !38)
!40 = !DILocation(line: 13, column: 35, scope: !38)
!41 = !DILocation(line: 13, column: 38, scope: !38)
!42 = !DILocation(line: 13, column: 47, scope: !38)
!43 = !DILocation(line: 0, scope: !38)
!44 = !DILocation(line: 13, column: 9, scope: !38)
!45 = !DILocation(line: 14, column: 5, scope: !38)
!46 = !DILocation(line: 15, column: 1, scope: !12)
