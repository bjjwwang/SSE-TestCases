; ModuleID = 'mac_bc/pass/INTERVAL_test_59.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_59.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @recursive(i32 noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a.addr, align 4, !dbg !17
  %dec = add nsw i32 %0, -1, !dbg !17
  store i32 %dec, i32* %a.addr, align 4, !dbg !17
  %1 = load i32, i32* %a.addr, align 4, !dbg !18
  %tobool = icmp ne i32 %1, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !21
  %call = call i32 @recursive(i32 noundef %2), !dbg !23
  store i32 %call, i32* %a.addr, align 4, !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !26
  ret i32 %3, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* %a, align 4, !dbg !33
  %cmp = icmp sgt i32 %0, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !37
  %call = call i32 @recursive(i32 noundef %1), !dbg !39
  store i32 %call, i32* %a, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !42
  %call1 = call i32 @abs(i32 noundef %2) #4, !dbg !44
  %call2 = call i32 @recursive(i32 noundef %call1), !dbg !45
  store i32 %call2, i32* %a, align 4, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %a, align 4, !dbg !47
  %cmp3 = icmp eq i32 %3, 0, !dbg !48
  call void @svf_assert(i1 noundef zeroext %cmp3), !dbg !49
  %4 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %4, !dbg !50
}

; Function Attrs: nounwind readnone willreturn
declare i32 @abs(i32 noundef) #2

declare void @svf_assert(i1 noundef zeroext) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_59.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_59.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 19, scope: !9)
!17 = !DILocation(line: 9, column: 3, scope: !9)
!18 = !DILocation(line: 10, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 5)
!20 = !DILocation(line: 10, column: 5, scope: !9)
!21 = !DILocation(line: 11, column: 17, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !10, line: 10, column: 8)
!23 = !DILocation(line: 11, column: 7, scope: !22)
!24 = !DILocation(line: 11, column: 5, scope: !22)
!25 = !DILocation(line: 12, column: 2, scope: !22)
!26 = !DILocation(line: 13, column: 9, scope: !9)
!27 = !DILocation(line: 13, column: 2, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !29, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DISubroutineType(types: !30)
!30 = !{!13}
!31 = !DILocalVariable(name: "a", scope: !28, file: !10, line: 17, type: !13)
!32 = !DILocation(line: 17, column: 6, scope: !28)
!33 = !DILocation(line: 18, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 18, column: 5)
!35 = !DILocation(line: 18, column: 7, scope: !34)
!36 = !DILocation(line: 18, column: 5, scope: !28)
!37 = !DILocation(line: 19, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 18, column: 12)
!39 = !DILocation(line: 19, column: 7, scope: !38)
!40 = !DILocation(line: 19, column: 5, scope: !38)
!41 = !DILocation(line: 20, column: 2, scope: !38)
!42 = !DILocation(line: 22, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !10, line: 21, column: 7)
!44 = !DILocation(line: 22, column: 17, scope: !43)
!45 = !DILocation(line: 22, column: 7, scope: !43)
!46 = !DILocation(line: 22, column: 5, scope: !43)
!47 = !DILocation(line: 24, column: 13, scope: !28)
!48 = !DILocation(line: 24, column: 15, scope: !28)
!49 = !DILocation(line: 24, column: 2, scope: !28)
!50 = !DILocation(line: 25, column: 1, scope: !28)
