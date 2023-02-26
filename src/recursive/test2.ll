; ModuleID = 'test2.ll'
source_filename = "./test2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [11 x i8] c"a=%d, c=%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @func(i32 noundef %b, i32* noundef %c) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32*, align 8
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32* %c, i32** %c.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %c.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** %c.addr, align 8, !dbg !20
  store i32 4, i32* %0, align 4, !dbg !21
  %1 = load i32, i32* %b.addr, align 4, !dbg !22
  %cmp = icmp eq i32 %1, 0, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !26
  br label %return, !dbg !26

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4, !dbg !28
  %sub = sub nsw i32 %2, 1, !dbg !29
  %3 = load i32*, i32** %c.addr, align 8, !dbg !30
  %call = call i32 @func(i32 noundef %sub, i32* noundef %3), !dbg !31
  %add = add nsw i32 %call, 1, !dbg !32
  store i32 %add, i32* %retval, align 4, !dbg !33
  br label %return, !dbg !33

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !34
  ret i32 %4, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %arr = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %arr, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %a, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 0, i32* %a, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %b, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 3, i32* %b, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %c, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 3, i32* %c, align 4, !dbg !48
  %0 = load i32, i32* %b, align 4, !dbg !49
  %call = call i32 @func(i32 noundef %0, i32* noundef %c), !dbg !50
  store i32 %call, i32* %a, align 4, !dbg !51
  %1 = load i32, i32* %c, align 4, !dbg !52
  %idxprom = sext i32 %1 to i64, !dbg !53
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i64 0, i64 %idxprom, !dbg !53
  store i32 1, i32* %arrayidx, align 4, !dbg !54
  %2 = load i32, i32* %a, align 4, !dbg !55
  %3 = load i32, i32* %c, align 4, !dbg !56
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 noundef %2, i32 noundef %3), !dbg !57
  ret i32 0, !dbg !58
}

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "test2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "func", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "./test2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!15 = !{}
!16 = !DILocalVariable(name: "b", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!17 = !DILocation(line: 3, column: 14, scope: !9)
!18 = !DILocalVariable(name: "c", arg: 2, scope: !9, file: !10, line: 3, type: !14)
!19 = !DILocation(line: 3, column: 22, scope: !9)
!20 = !DILocation(line: 4, column: 6, scope: !9)
!21 = !DILocation(line: 4, column: 8, scope: !9)
!22 = !DILocation(line: 5, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 5, column: 9)
!24 = !DILocation(line: 5, column: 11, scope: !23)
!25 = !DILocation(line: 5, column: 9, scope: !9)
!26 = !DILocation(line: 6, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 5, column: 17)
!28 = !DILocation(line: 8, column: 17, scope: !9)
!29 = !DILocation(line: 8, column: 18, scope: !9)
!30 = !DILocation(line: 8, column: 22, scope: !9)
!31 = !DILocation(line: 8, column: 12, scope: !9)
!32 = !DILocation(line: 8, column: 25, scope: !9)
!33 = !DILocation(line: 8, column: 5, scope: !9)
!34 = !DILocation(line: 9, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !36, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!36 = !DISubroutineType(types: !37)
!37 = !{!13}
!38 = !DILocalVariable(name: "arr", scope: !35, file: !10, line: 11, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 5)
!42 = !DILocation(line: 11, column: 9, scope: !35)
!43 = !DILocalVariable(name: "a", scope: !35, file: !10, line: 12, type: !13)
!44 = !DILocation(line: 12, column: 9, scope: !35)
!45 = !DILocalVariable(name: "b", scope: !35, file: !10, line: 13, type: !13)
!46 = !DILocation(line: 13, column: 9, scope: !35)
!47 = !DILocalVariable(name: "c", scope: !35, file: !10, line: 14, type: !13)
!48 = !DILocation(line: 14, column: 9, scope: !35)
!49 = !DILocation(line: 15, column: 15, scope: !35)
!50 = !DILocation(line: 15, column: 10, scope: !35)
!51 = !DILocation(line: 15, column: 8, scope: !35)
!52 = !DILocation(line: 16, column: 9, scope: !35)
!53 = !DILocation(line: 16, column: 5, scope: !35)
!54 = !DILocation(line: 16, column: 12, scope: !35)
!55 = !DILocation(line: 17, column: 26, scope: !35)
!56 = !DILocation(line: 17, column: 29, scope: !35)
!57 = !DILocation(line: 17, column: 5, scope: !35)
!58 = !DILocation(line: 18, column: 1, scope: !35)
