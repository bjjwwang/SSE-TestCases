; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/Overrun_Bad_Boundary_Check_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Overrun_Bad_Boundary_Check_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad01(i32 noundef %n) #0 !dbg !9 {
entry:
  %n.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %y = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i8** %p, metadata !17, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* %n.addr, align 4, !dbg !21
  %conv = sext i32 %0 to i64, !dbg !21
  %call = call i8* @malloc(i64 noundef %conv) #4, !dbg !22
  store i8* %call, i8** %p, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %y, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = load i32, i32* %n.addr, align 4, !dbg !25
  store i32 %1, i32* %y, align 4, !dbg !24
  %2 = load i8*, i8** %p, align 8, !dbg !26
  %tobool = icmp ne i8* %2, null, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %p, align 8, !dbg !29
  %4 = load i32, i32* %y, align 4, !dbg !31
  %idxprom = sext i32 %4 to i64, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !29
  store i8 97, i8* %arrayidx, align 1, !dbg !32
  %5 = load i8*, i8** %p, align 8, !dbg !33
  call void @free(i8* noundef %5), !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !37 {
entry:
  call void @TestCaseBad01(i32 noundef 10), !dbg !40
  ret i32 0, !dbg !41
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Overrun_Bad_Boundary_Check_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestCaseBad01", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "general/Overrun_Bad_Boundary_Check_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "n", arg: 1, scope: !9, file: !10, line: 9, type: !13)
!16 = !DILocation(line: 9, column: 24, scope: !9)
!17 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 11, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !DILocation(line: 11, column: 11, scope: !9)
!21 = !DILocation(line: 11, column: 22, scope: !9)
!22 = !DILocation(line: 11, column: 15, scope: !9)
!23 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 12, type: !13)
!24 = !DILocation(line: 12, column: 9, scope: !9)
!25 = !DILocation(line: 12, column: 13, scope: !9)
!26 = !DILocation(line: 13, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 9)
!28 = !DILocation(line: 13, column: 9, scope: !9)
!29 = !DILocation(line: 15, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !10, line: 13, column: 12)
!31 = !DILocation(line: 15, column: 11, scope: !30)
!32 = !DILocation(line: 15, column: 14, scope: !30)
!33 = !DILocation(line: 16, column: 14, scope: !30)
!34 = !DILocation(line: 16, column: 9, scope: !30)
!35 = !DILocation(line: 17, column: 5, scope: !30)
!36 = !DILocation(line: 18, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 20, type: !38, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!38 = !DISubroutineType(types: !39)
!39 = !{!13}
!40 = !DILocation(line: 21, column: 5, scope: !37)
!41 = !DILocation(line: 22, column: 1, scope: !37)
