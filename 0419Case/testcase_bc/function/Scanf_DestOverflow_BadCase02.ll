; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/Scanf_DestOverflow_BadCase02.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/Scanf_DestOverflow_BadCase02.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_20(i8* noundef %p) #0 !dbg !9 {
entry:
  %p.addr = alloca i8*, align 8
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i8*, i8** %p.addr, align 8, !dbg !18
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %0), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @scanf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %p = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %argc.addr, align 4, !dbg !30
  %cmp = icmp slt i32 %0, 2, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !34
  br label %return, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %p, metadata !36, metadata !DIExpression()), !dbg !37
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !38
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !38
  store i8* %2, i8** %p, align 8, !dbg !37
  %3 = load i8*, i8** %p, align 8, !dbg !39
  call void @cwe120_c_20(i8* noundef %3), !dbg !40
  store i32 0, i32* %retval, align 4, !dbg !41
  br label %return, !dbg !41

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %4, !dbg !42
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/Scanf_DestOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_20", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "function/Scanf_DestOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 14, type: !13)
!17 = !DILocation(line: 14, column: 24, scope: !9)
!18 = !DILocation(line: 17, column: 17, scope: !9)
!19 = !DILocation(line: 17, column: 5, scope: !9)
!20 = !DILocation(line: 18, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 19, type: !22, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!22 = !DISubroutineType(types: !23)
!23 = !{!24, !24, !25}
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!26 = !DILocalVariable(name: "argc", arg: 1, scope: !21, file: !10, line: 19, type: !24)
!27 = !DILocation(line: 19, column: 14, scope: !21)
!28 = !DILocalVariable(name: "argv", arg: 2, scope: !21, file: !10, line: 19, type: !25)
!29 = !DILocation(line: 19, column: 27, scope: !21)
!30 = !DILocation(line: 21, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !10, line: 21, column: 9)
!32 = !DILocation(line: 21, column: 14, scope: !31)
!33 = !DILocation(line: 21, column: 9, scope: !21)
!34 = !DILocation(line: 22, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 21, column: 19)
!36 = !DILocalVariable(name: "p", scope: !21, file: !10, line: 24, type: !13)
!37 = !DILocation(line: 24, column: 11, scope: !21)
!38 = !DILocation(line: 24, column: 15, scope: !21)
!39 = !DILocation(line: 25, column: 17, scope: !21)
!40 = !DILocation(line: 25, column: 5, scope: !21)
!41 = !DILocation(line: 27, column: 5, scope: !21)
!42 = !DILocation(line: 28, column: 1, scope: !21)
