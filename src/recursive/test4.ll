; ModuleID = 'test4.ll'
source_filename = "./test4.c"
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
  %0 = load i32, i32* %b.addr, align 4, !dbg !20
  %1 = load i32*, i32** %c.addr, align 8, !dbg !21
  store i32 %0, i32* %1, align 4, !dbg !22
  %2 = load i32, i32* %b.addr, align 4, !dbg !23
  %cmp = icmp eq i32 %2, 0, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %b.addr, align 4, !dbg !29
  %sub = sub nsw i32 %3, 1, !dbg !30
  %4 = load i32*, i32** %c.addr, align 8, !dbg !31
  %call = call i32 @func(i32 noundef %sub, i32* noundef %4), !dbg !32
  %add = add nsw i32 %call, 1, !dbg !33
  store i32 %add, i32* %retval, align 4, !dbg !34
  br label %return, !dbg !34

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %5, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !36 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 0, i32* %a, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %b, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 3, i32* %b, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %c, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 3, i32* %c, align 4, !dbg !44
  %0 = load i32, i32* %b, align 4, !dbg !45
  %call = call i32 @func(i32 noundef %0, i32* noundef %c), !dbg !46
  store i32 %call, i32* %a, align 4, !dbg !47
  %1 = load i32, i32* %a, align 4, !dbg !48
  %2 = load i32, i32* %c, align 4, !dbg !49
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 noundef %1, i32 noundef %2), !dbg !50
  ret i32 0, !dbg !51
}

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "test4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "func", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "./test4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/Test-Suite/recursive")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!15 = !{}
!16 = !DILocalVariable(name: "b", arg: 1, scope: !9, file: !10, line: 4, type: !13)
!17 = !DILocation(line: 4, column: 14, scope: !9)
!18 = !DILocalVariable(name: "c", arg: 2, scope: !9, file: !10, line: 4, type: !14)
!19 = !DILocation(line: 4, column: 22, scope: !9)
!20 = !DILocation(line: 5, column: 10, scope: !9)
!21 = !DILocation(line: 5, column: 6, scope: !9)
!22 = !DILocation(line: 5, column: 8, scope: !9)
!23 = !DILocation(line: 6, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 9)
!25 = !DILocation(line: 6, column: 11, scope: !24)
!26 = !DILocation(line: 6, column: 9, scope: !9)
!27 = !DILocation(line: 7, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 6, column: 17)
!29 = !DILocation(line: 9, column: 17, scope: !9)
!30 = !DILocation(line: 9, column: 18, scope: !9)
!31 = !DILocation(line: 9, column: 22, scope: !9)
!32 = !DILocation(line: 9, column: 12, scope: !9)
!33 = !DILocation(line: 9, column: 25, scope: !9)
!34 = !DILocation(line: 9, column: 5, scope: !9)
!35 = !DILocation(line: 10, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !37, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!37 = !DISubroutineType(types: !38)
!38 = !{!13}
!39 = !DILocalVariable(name: "a", scope: !36, file: !10, line: 12, type: !13)
!40 = !DILocation(line: 12, column: 9, scope: !36)
!41 = !DILocalVariable(name: "b", scope: !36, file: !10, line: 13, type: !13)
!42 = !DILocation(line: 13, column: 9, scope: !36)
!43 = !DILocalVariable(name: "c", scope: !36, file: !10, line: 14, type: !13)
!44 = !DILocation(line: 14, column: 9, scope: !36)
!45 = !DILocation(line: 15, column: 15, scope: !36)
!46 = !DILocation(line: 15, column: 10, scope: !36)
!47 = !DILocation(line: 15, column: 8, scope: !36)
!48 = !DILocation(line: 16, column: 26, scope: !36)
!49 = !DILocation(line: 16, column: 29, scope: !36)
!50 = !DILocation(line: 16, column: 5, scope: !36)
!51 = !DILocation(line: 17, column: 1, scope: !36)
