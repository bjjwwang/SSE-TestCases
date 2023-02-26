; ModuleID = 'test1.ll'
source_filename = "./test1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [5 x i8] c"a=%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @func(i32 noundef %b) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %b.addr, align 4, !dbg !17
  %cmp = icmp eq i32 %0, 0, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !21
  br label %return, !dbg !21

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %b.addr, align 4, !dbg !23
  %sub = sub nsw i32 %1, 1, !dbg !24
  %call = call i32 @func(i32 noundef %sub), !dbg !25
  %add = add nsw i32 %call, 1, !dbg !26
  store i32 %add, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !28
  ret i32 %2, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !29 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 0, i32* %a, align 4, !dbg !33
  %call = call i32 @func(i32 noundef 3), !dbg !34
  store i32 %call, i32* %a, align 4, !dbg !35
  %0 = load i32, i32* %a, align 4, !dbg !36
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 noundef %0), !dbg !37
  ret i32 0, !dbg !38
}

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "test1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "func", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "./test1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "b", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!16 = !DILocation(line: 3, column: 14, scope: !9)
!17 = !DILocation(line: 4, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 4, column: 9)
!19 = !DILocation(line: 4, column: 11, scope: !18)
!20 = !DILocation(line: 4, column: 9, scope: !9)
!21 = !DILocation(line: 5, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 4, column: 17)
!23 = !DILocation(line: 7, column: 17, scope: !9)
!24 = !DILocation(line: 7, column: 18, scope: !9)
!25 = !DILocation(line: 7, column: 12, scope: !9)
!26 = !DILocation(line: 7, column: 22, scope: !9)
!27 = !DILocation(line: 7, column: 5, scope: !9)
!28 = !DILocation(line: 8, column: 1, scope: !9)
!29 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !30, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!30 = !DISubroutineType(types: !31)
!31 = !{!13}
!32 = !DILocalVariable(name: "a", scope: !29, file: !10, line: 10, type: !13)
!33 = !DILocation(line: 10, column: 9, scope: !29)
!34 = !DILocation(line: 11, column: 10, scope: !29)
!35 = !DILocation(line: 11, column: 8, scope: !29)
!36 = !DILocation(line: 12, column: 20, scope: !29)
!37 = !DILocation(line: 12, column: 5, scope: !29)
!38 = !DILocation(line: 13, column: 1, scope: !29)
