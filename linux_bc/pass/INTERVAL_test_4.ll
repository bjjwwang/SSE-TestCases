; ModuleID = 'linux_bc/pass/INTERVAL_test_4.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !14
  call void @srand(i32 %call) #4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %a, metadata !16, metadata !DIExpression()), !dbg !17
  %call1 = call i32 @rand() #4, !dbg !18
  %rem = srem i32 %call1, 5, !dbg !19
  store i32 %rem, i32* %a, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %b, metadata !20, metadata !DIExpression()), !dbg !21
  %call2 = call i32 @rand() #4, !dbg !22
  %rem3 = srem i32 %call2, 5, !dbg !23
  store i32 %rem3, i32* %b, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %c, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32, i32* %a, align 4, !dbg !26
  %1 = load i32, i32* %b, align 4, !dbg !27
  %mul = mul nsw i32 %0, %1, !dbg !28
  store i32 %mul, i32* %c, align 4, !dbg !25
  %2 = load i32, i32* %c, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 16, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %a, align 4, !dbg !33
  %cmp4 = icmp eq i32 %3, 4, !dbg !35
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !36

land.rhs:                                         ; preds = %if.then
  %4 = load i32, i32* %b, align 4, !dbg !37
  %cmp5 = icmp eq i32 %4, 4, !dbg !38
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %5 = phi i1 [ false, %if.then ], [ %cmp5, %land.rhs ], !dbg !39
  call void @svf_assert(i1 zeroext %5), !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  %6 = load i32, i32* %a, align 4, !dbg !42
  %cmp6 = icmp slt i32 %6, 4, !dbg !44
  br i1 %cmp6, label %lor.end, label %lor.rhs, !dbg !45

lor.rhs:                                          ; preds = %if.else
  %7 = load i32, i32* %b, align 4, !dbg !46
  %cmp7 = icmp slt i32 %7, 4, !dbg !47
  br label %lor.end, !dbg !45

lor.end:                                          ; preds = %lor.rhs, %if.else
  %8 = phi i1 [ true, %if.else ], [ %cmp7, %lor.rhs ]
  call void @svf_assert(i1 zeroext %8), !dbg !48
  br label %if.end

if.end:                                           ; preds = %lor.end, %land.end
  %9 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %9, !dbg !49
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
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_4.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_4.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocation(line: 6, column: 8, scope: !9)
!15 = !DILocation(line: 6, column: 2, scope: !9)
!16 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 6, scope: !9)
!18 = !DILocation(line: 7, column: 10, scope: !9)
!19 = !DILocation(line: 7, column: 17, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 8, type: !13)
!21 = !DILocation(line: 8, column: 9, scope: !9)
!22 = !DILocation(line: 8, column: 13, scope: !9)
!23 = !DILocation(line: 8, column: 20, scope: !9)
!24 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 9, type: !13)
!25 = !DILocation(line: 9, column: 9, scope: !9)
!26 = !DILocation(line: 9, column: 13, scope: !9)
!27 = !DILocation(line: 9, column: 17, scope: !9)
!28 = !DILocation(line: 9, column: 15, scope: !9)
!29 = !DILocation(line: 10, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 9)
!31 = !DILocation(line: 10, column: 11, scope: !30)
!32 = !DILocation(line: 10, column: 9, scope: !9)
!33 = !DILocation(line: 11, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 10, column: 18)
!35 = !DILocation(line: 11, column: 22, scope: !34)
!36 = !DILocation(line: 11, column: 27, scope: !34)
!37 = !DILocation(line: 11, column: 30, scope: !34)
!38 = !DILocation(line: 11, column: 32, scope: !34)
!39 = !DILocation(line: 0, scope: !34)
!40 = !DILocation(line: 11, column: 9, scope: !34)
!41 = !DILocation(line: 12, column: 5, scope: !34)
!42 = !DILocation(line: 14, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !30, file: !10, line: 13, column: 10)
!44 = !DILocation(line: 14, column: 22, scope: !43)
!45 = !DILocation(line: 14, column: 26, scope: !43)
!46 = !DILocation(line: 14, column: 29, scope: !43)
!47 = !DILocation(line: 14, column: 31, scope: !43)
!48 = !DILocation(line: 14, column: 9, scope: !43)
!49 = !DILocation(line: 16, column: 1, scope: !9)
