; ModuleID = 'test3.ll'
source_filename = "./test3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@c = global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [11 x i8] c"a=%d, c=%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @func(i32 noundef %b) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 4, i32* @c, align 4, !dbg !20
  %0 = load i32, i32* %b.addr, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !25
  br label %return, !dbg !25

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %b.addr, align 4, !dbg !27
  %sub = sub nsw i32 %1, 1, !dbg !28
  %call = call i32 @func(i32 noundef %sub), !dbg !29
  %add = add nsw i32 %call, 1, !dbg !30
  store i32 %add, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %2, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !33 {
entry:
  %arr = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %arr, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %a, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 0, i32* %a, align 4, !dbg !42
  %call = call i32 @func(i32 noundef 3), !dbg !43
  store i32 %call, i32* %a, align 4, !dbg !44
  %0 = load i32, i32* @c, align 4, !dbg !45
  %idxprom = sext i32 %0 to i64, !dbg !46
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i64 0, i64 %idxprom, !dbg !46
  store i32 1, i32* %arrayidx, align 4, !dbg !47
  %1 = load i32, i32* %a, align 4, !dbg !48
  %2 = load i32, i32* @c, align 4, !dbg !49
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 noundef %1, i32 noundef %2), !dbg !50
  ret i32 0, !dbg !51
}

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !5, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "test3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!4 = !{!0}
!5 = !DIFile(filename: "./test3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "func", scope: !5, file: !5, line: 4, type: !15, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "b", arg: 1, scope: !14, file: !5, line: 4, type: !6)
!19 = !DILocation(line: 4, column: 14, scope: !14)
!20 = !DILocation(line: 5, column: 7, scope: !14)
!21 = !DILocation(line: 6, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 6, column: 9)
!23 = !DILocation(line: 6, column: 11, scope: !22)
!24 = !DILocation(line: 6, column: 9, scope: !14)
!25 = !DILocation(line: 7, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 6, column: 17)
!27 = !DILocation(line: 9, column: 17, scope: !14)
!28 = !DILocation(line: 9, column: 18, scope: !14)
!29 = !DILocation(line: 9, column: 12, scope: !14)
!30 = !DILocation(line: 9, column: 22, scope: !14)
!31 = !DILocation(line: 9, column: 5, scope: !14)
!32 = !DILocation(line: 10, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 11, type: !34, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocalVariable(name: "arr", scope: !33, file: !5, line: 12, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 5)
!40 = !DILocation(line: 12, column: 9, scope: !33)
!41 = !DILocalVariable(name: "a", scope: !33, file: !5, line: 13, type: !6)
!42 = !DILocation(line: 13, column: 9, scope: !33)
!43 = !DILocation(line: 14, column: 10, scope: !33)
!44 = !DILocation(line: 14, column: 8, scope: !33)
!45 = !DILocation(line: 15, column: 9, scope: !33)
!46 = !DILocation(line: 15, column: 5, scope: !33)
!47 = !DILocation(line: 15, column: 12, scope: !33)
!48 = !DILocation(line: 16, column: 26, scope: !33)
!49 = !DILocation(line: 16, column: 29, scope: !33)
!50 = !DILocation(line: 16, column: 5, scope: !33)
!51 = !DILocation(line: 17, column: 1, scope: !33)
