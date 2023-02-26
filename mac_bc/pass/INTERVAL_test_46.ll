; ModuleID = 'mac_bc/pass/INTERVAL_test_46.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_46.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0
@result = global i32 0, align 4, !dbg !5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32 noundef %limit) #0 !dbg !16 {
entry:
  %limit.addr = alloca i32, align 4
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* @count, align 4, !dbg !22
  %1 = load i32, i32* %limit.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %0, %1, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @count, align 4, !dbg !27
  %add = add nsw i32 %2, 1, !dbg !29
  store i32 %add, i32* @result, align 4, !dbg !30
  %3 = load i32, i32* @count, align 4, !dbg !31
  %inc = add nsw i32 %3, 1, !dbg !31
  store i32 %inc, i32* @count, align 4, !dbg !31
  %4 = load i32, i32* %limit.addr, align 4, !dbg !32
  call void @bar(i32 noundef %4), !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @bar(i32 noundef %limit) #0 !dbg !36 {
entry:
  %limit.addr = alloca i32, align 4
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @count, align 4, !dbg !39
  %1 = load i32, i32* %limit.addr, align 4, !dbg !41
  %cmp = icmp slt i32 %0, %1, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @count, align 4, !dbg !44
  %sub = sub nsw i32 %2, 1, !dbg !46
  store i32 %sub, i32* @result, align 4, !dbg !47
  %3 = load i32, i32* @count, align 4, !dbg !48
  %inc = add nsw i32 %3, 1, !dbg !48
  store i32 %inc, i32* @count, align 4, !dbg !48
  %4 = load i32, i32* %limit.addr, align 4, !dbg !49
  call void @foo(i32 noundef %4), !dbg !50
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %limit = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %limit, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* %limit, align 4, !dbg !58
  %cmp = icmp sgt i32 %0, 0, !dbg !60
  br i1 %cmp, label %if.then, label %if.else5, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %limit, align 4, !dbg !62
  call void @foo(i32 noundef %1), !dbg !64
  %2 = load i32, i32* %limit, align 4, !dbg !65
  %rem = srem i32 %2, 2, !dbg !67
  %cmp1 = icmp eq i32 %rem, 1, !dbg !68
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !69

if.then2:                                         ; preds = %if.then
  %3 = load i32, i32* @result, align 4, !dbg !70
  %4 = load i32, i32* %limit, align 4, !dbg !72
  %cmp3 = icmp eq i32 %3, %4, !dbg !73
  call void @svf_assert(i1 noundef zeroext %cmp3), !dbg !74
  br label %if.end, !dbg !75

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* @result, align 4, !dbg !76
  %6 = load i32, i32* %limit, align 4, !dbg !78
  %sub = sub nsw i32 %6, 2, !dbg !79
  %cmp4 = icmp eq i32 %5, %sub, !dbg !80
  call void @svf_assert(i1 noundef zeroext %cmp4), !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end7, !dbg !82

if.else5:                                         ; preds = %entry
  %7 = load i32, i32* @result, align 4, !dbg !83
  %cmp6 = icmp eq i32 %7, 0, !dbg !85
  call void @svf_assert(i1 noundef zeroext %cmp6), !dbg !86
  br label %if.end7

if.end7:                                          ; preds = %if.else5, %if.end
  %8 = load i32, i32* %retval, align 4, !dbg !87
  ret i32 %8, !dbg !87
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !7, line: 8, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_46.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0, !5}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !7, line: 9, type: !8, isLocal: false, isDefinition: true)
!7 = !DIFile(filename: "src/pass/INTERVAL_test_46.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "foo", scope: !7, file: !7, line: 14, type: !17, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !8}
!19 = !{}
!20 = !DILocalVariable(name: "limit", arg: 1, scope: !16, file: !7, line: 14, type: !8)
!21 = !DILocation(line: 14, column: 14, scope: !16)
!22 = !DILocation(line: 15, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !7, line: 15, column: 8)
!24 = !DILocation(line: 15, column: 16, scope: !23)
!25 = !DILocation(line: 15, column: 14, scope: !23)
!26 = !DILocation(line: 15, column: 8, scope: !16)
!27 = !DILocation(line: 16, column: 18, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !7, line: 15, column: 23)
!29 = !DILocation(line: 16, column: 24, scope: !28)
!30 = !DILocation(line: 16, column: 16, scope: !28)
!31 = !DILocation(line: 17, column: 14, scope: !28)
!32 = !DILocation(line: 18, column: 13, scope: !28)
!33 = !DILocation(line: 18, column: 9, scope: !28)
!34 = !DILocation(line: 19, column: 5, scope: !28)
!35 = !DILocation(line: 20, column: 5, scope: !16)
!36 = distinct !DISubprogram(name: "bar", scope: !7, file: !7, line: 23, type: !17, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!37 = !DILocalVariable(name: "limit", arg: 1, scope: !36, file: !7, line: 23, type: !8)
!38 = !DILocation(line: 23, column: 14, scope: !36)
!39 = !DILocation(line: 24, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !7, line: 24, column: 8)
!41 = !DILocation(line: 24, column: 16, scope: !40)
!42 = !DILocation(line: 24, column: 14, scope: !40)
!43 = !DILocation(line: 24, column: 8, scope: !36)
!44 = !DILocation(line: 25, column: 18, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !7, line: 24, column: 23)
!46 = !DILocation(line: 25, column: 24, scope: !45)
!47 = !DILocation(line: 25, column: 16, scope: !45)
!48 = !DILocation(line: 26, column: 14, scope: !45)
!49 = !DILocation(line: 27, column: 13, scope: !45)
!50 = !DILocation(line: 27, column: 9, scope: !45)
!51 = !DILocation(line: 28, column: 5, scope: !45)
!52 = !DILocation(line: 29, column: 5, scope: !36)
!53 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 32, type: !54, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!54 = !DISubroutineType(types: !55)
!55 = !{!8}
!56 = !DILocalVariable(name: "limit", scope: !53, file: !7, line: 33, type: !8)
!57 = !DILocation(line: 33, column: 9, scope: !53)
!58 = !DILocation(line: 34, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !7, line: 34, column: 8)
!60 = !DILocation(line: 34, column: 14, scope: !59)
!61 = !DILocation(line: 34, column: 8, scope: !53)
!62 = !DILocation(line: 35, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !7, line: 34, column: 19)
!64 = !DILocation(line: 35, column: 9, scope: !63)
!65 = !DILocation(line: 36, column: 12, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !7, line: 36, column: 12)
!67 = !DILocation(line: 36, column: 18, scope: !66)
!68 = !DILocation(line: 36, column: 22, scope: !66)
!69 = !DILocation(line: 36, column: 12, scope: !63)
!70 = !DILocation(line: 37, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !7, line: 36, column: 28)
!72 = !DILocation(line: 37, column: 34, scope: !71)
!73 = !DILocation(line: 37, column: 31, scope: !71)
!74 = !DILocation(line: 37, column: 13, scope: !71)
!75 = !DILocation(line: 38, column: 9, scope: !71)
!76 = !DILocation(line: 40, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !66, file: !7, line: 39, column: 14)
!78 = !DILocation(line: 40, column: 34, scope: !77)
!79 = !DILocation(line: 40, column: 40, scope: !77)
!80 = !DILocation(line: 40, column: 31, scope: !77)
!81 = !DILocation(line: 40, column: 13, scope: !77)
!82 = !DILocation(line: 42, column: 5, scope: !63)
!83 = !DILocation(line: 44, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !59, file: !7, line: 43, column: 10)
!85 = !DILocation(line: 44, column: 27, scope: !84)
!86 = !DILocation(line: 44, column: 9, scope: !84)
!87 = !DILocation(line: 46, column: 1, scope: !53)
