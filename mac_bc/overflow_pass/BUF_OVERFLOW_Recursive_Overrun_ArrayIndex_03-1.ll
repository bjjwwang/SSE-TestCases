; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32* noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32*, i32** %i.addr, align 8, !dbg !18
  %1 = load i32, i32* %0, align 4, !dbg !19
  %add = add nsw i32 %1, 1, !dbg !20
  %2 = load i32*, i32** %i.addr, align 8, !dbg !21
  store i32 %add, i32* %2, align 4, !dbg !22
  %3 = load i32*, i32** %i.addr, align 8, !dbg !23
  %4 = load i32, i32* %3, align 4, !dbg !25
  %cmp = icmp slt i32 %4, 10, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %i.addr, align 8, !dbg !28
  call void @foo(i32* noundef %5), !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [50 x i32], align 16
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [50 x i32]* %buffer, metadata !36, metadata !DIExpression()), !dbg !40
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !41
  call void @srand(i32 noundef %call), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !44
  %call1 = call i32 @rand(), !dbg !45
  %rem = srem i32 %call1, 20, !dbg !46
  store i32 %rem, i32* %i, align 4, !dbg !44
  call void @foo(i32* noundef %i), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %x, metadata !48, metadata !DIExpression()), !dbg !50
  %0 = load i32, i32* %i, align 4, !dbg !51
  store i32 %0, i32* %x, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %x, align 4, !dbg !53
  %2 = load i32, i32* %i, align 4, !dbg !55
  %cmp = icmp slt i32 %1, %2, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %x, align 4, !dbg !58
  %idxprom = sext i32 %3 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %x, align 4, !dbg !63
  %inc = add nsw i32 %4, 1, !dbg !63
  store i32 %inc, i32* %x, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %retval, align 4, !dbg !68
  ret i32 %5, !dbg !68
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 15, scope: !9)
!18 = !DILocation(line: 8, column: 11, scope: !9)
!19 = !DILocation(line: 8, column: 10, scope: !9)
!20 = !DILocation(line: 8, column: 13, scope: !9)
!21 = !DILocation(line: 8, column: 6, scope: !9)
!22 = !DILocation(line: 8, column: 8, scope: !9)
!23 = !DILocation(line: 9, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!25 = !DILocation(line: 9, column: 8, scope: !24)
!26 = !DILocation(line: 9, column: 11, scope: !24)
!27 = !DILocation(line: 9, column: 8, scope: !9)
!28 = !DILocation(line: 10, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !10, line: 9, column: 17)
!30 = !DILocation(line: 10, column: 9, scope: !29)
!31 = !DILocation(line: 11, column: 5, scope: !29)
!32 = !DILocation(line: 12, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !34, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!34 = !DISubroutineType(types: !35)
!35 = !{!14}
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !10, line: 15, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 15, column: 6, scope: !33)
!41 = !DILocation(line: 16, column: 8, scope: !33)
!42 = !DILocation(line: 16, column: 2, scope: !33)
!43 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 17, type: !14)
!44 = !DILocation(line: 17, column: 9, scope: !33)
!45 = !DILocation(line: 17, column: 13, scope: !33)
!46 = !DILocation(line: 17, column: 20, scope: !33)
!47 = !DILocation(line: 18, column: 5, scope: !33)
!48 = !DILocalVariable(name: "x", scope: !49, file: !10, line: 20, type: !14)
!49 = distinct !DILexicalBlock(scope: !33, file: !10, line: 20, column: 2)
!50 = !DILocation(line: 20, column: 10, scope: !49)
!51 = !DILocation(line: 20, column: 14, scope: !49)
!52 = !DILocation(line: 20, column: 6, scope: !49)
!53 = !DILocation(line: 20, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !10, line: 20, column: 2)
!55 = !DILocation(line: 20, column: 21, scope: !54)
!56 = !DILocation(line: 20, column: 19, scope: !54)
!57 = !DILocation(line: 20, column: 2, scope: !49)
!58 = !DILocation(line: 21, column: 10, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !10, line: 20, column: 29)
!60 = !DILocation(line: 21, column: 3, scope: !59)
!61 = !DILocation(line: 21, column: 13, scope: !59)
!62 = !DILocation(line: 22, column: 2, scope: !59)
!63 = !DILocation(line: 20, column: 25, scope: !54)
!64 = !DILocation(line: 20, column: 2, scope: !54)
!65 = distinct !{!65, !57, !66, !67}
!66 = !DILocation(line: 22, column: 2, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 23, column: 1, scope: !33)
