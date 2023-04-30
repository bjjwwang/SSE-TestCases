; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/dirty/ArrayIndex_WithoutCheckExternalData_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/dirty/ArrayIndex_WithoutCheckExternalData_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_01(i8* noundef %p, i8* noundef %q) #0 !dbg !9 {
entry:
  %p.addr = alloca i8*, align 8
  %q.addr = alloca i8*, align 8
  %src = alloca i8*, align 8
  %tmp = alloca i8*, align 8
  %tmp1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i8* %q, i8** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %q.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %src, metadata !20, metadata !DIExpression()), !dbg !21
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %src, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %tmp, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %tmp1, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %q.addr, align 8, !dbg !26
  store i8* %0, i8** %tmp, align 8, !dbg !27
  %1 = load i8*, i8** %p.addr, align 8, !dbg !28
  store i8* %1, i8** %tmp1, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %2, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !40
  %conv = trunc i32 %3 to i8, !dbg !40
  %4 = load i8*, i8** %tmp, align 8, !dbg !42
  %5 = load i32, i32* %i, align 4, !dbg !43
  %idxprom = sext i32 %5 to i64, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !42
  store i8 %conv, i8* %arrayidx, align 1, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %6, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %tmp1, align 8, !dbg !51
  %8 = load i8*, i8** %src, align 8, !dbg !52
  %call = call i64 @strlen(i8* noundef %8), !dbg !53
  %9 = load i8*, i8** %src, align 8, !dbg !54
  %10 = load i8*, i8** %src, align 8, !dbg !55
  %call1 = call i64 @strlen(i8* noundef %10), !dbg !56
  %call2 = call i32 (i8*, i64, i8*, i64, ...) bitcast (i32 (...)* @memcpy_s to i32 (i8*, i64, i8*, i64, ...)*)(i8* noundef %7, i64 noundef %call, i8* noundef %9, i64 noundef %call1), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @memcpy_s(...) #2

declare i64 @strlen(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %p = alloca [100 x i8], align 16
  %q = alloca [99 x i8], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [100 x i8]* %p, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [99 x i8]* %q, metadata !67, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %p, i64 0, i64 0, !dbg !72
  %arraydecay1 = getelementptr inbounds [99 x i8], [99 x i8]* %q, i64 0, i64 0, !dbg !73
  call void @test_bad_01(i8* noundef %arraydecay, i8* noundef %arraydecay1), !dbg !74
  ret i32 0, !dbg !75
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/dirty/ArrayIndex_WithoutCheckExternalData_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "test_bad_01", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "dirty/ArrayIndex_WithoutCheckExternalData_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 14, type: !13)
!17 = !DILocation(line: 14, column: 24, scope: !9)
!18 = !DILocalVariable(name: "q", arg: 2, scope: !9, file: !10, line: 14, type: !13)
!19 = !DILocation(line: 14, column: 33, scope: !9)
!20 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 16, type: !13)
!21 = !DILocation(line: 16, column: 11, scope: !9)
!22 = !DILocalVariable(name: "tmp", scope: !9, file: !10, line: 17, type: !13)
!23 = !DILocation(line: 17, column: 11, scope: !9)
!24 = !DILocalVariable(name: "tmp1", scope: !9, file: !10, line: 17, type: !13)
!25 = !DILocation(line: 17, column: 17, scope: !9)
!26 = !DILocation(line: 18, column: 11, scope: !9)
!27 = !DILocation(line: 18, column: 9, scope: !9)
!28 = !DILocation(line: 20, column: 12, scope: !9)
!29 = !DILocation(line: 20, column: 10, scope: !9)
!30 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 21, type: !31)
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DILocation(line: 21, column: 9, scope: !9)
!33 = !DILocation(line: 22, column: 12, scope: !34)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 22, column: 5)
!35 = !DILocation(line: 22, column: 10, scope: !34)
!36 = !DILocation(line: 22, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 22, column: 5)
!38 = !DILocation(line: 22, column: 19, scope: !37)
!39 = !DILocation(line: 22, column: 5, scope: !34)
!40 = !DILocation(line: 24, column: 18, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 22, column: 31)
!42 = !DILocation(line: 24, column: 9, scope: !41)
!43 = !DILocation(line: 24, column: 13, scope: !41)
!44 = !DILocation(line: 24, column: 16, scope: !41)
!45 = !DILocation(line: 25, column: 5, scope: !41)
!46 = !DILocation(line: 22, column: 27, scope: !37)
!47 = !DILocation(line: 22, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 25, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 26, column: 14, scope: !9)
!52 = !DILocation(line: 26, column: 27, scope: !9)
!53 = !DILocation(line: 26, column: 20, scope: !9)
!54 = !DILocation(line: 26, column: 33, scope: !9)
!55 = !DILocation(line: 26, column: 45, scope: !9)
!56 = !DILocation(line: 26, column: 38, scope: !9)
!57 = !DILocation(line: 26, column: 5, scope: !9)
!58 = !DILocation(line: 27, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 30, type: !60, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DISubroutineType(types: !61)
!61 = !{!31}
!62 = !DILocalVariable(name: "p", scope: !59, file: !10, line: 32, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 800, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 100)
!66 = !DILocation(line: 32, column: 10, scope: !59)
!67 = !DILocalVariable(name: "q", scope: !59, file: !10, line: 32, type: !68)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 792, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 99)
!71 = !DILocation(line: 32, column: 18, scope: !59)
!72 = !DILocation(line: 33, column: 17, scope: !59)
!73 = !DILocation(line: 33, column: 19, scope: !59)
!74 = !DILocation(line: 33, column: 5, scope: !59)
!75 = !DILocation(line: 34, column: 5, scope: !59)
