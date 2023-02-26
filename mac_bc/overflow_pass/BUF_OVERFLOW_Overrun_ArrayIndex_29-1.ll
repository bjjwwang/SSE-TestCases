; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.ar = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 5], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %i = alloca i32*, align 8
  %ar = alloca [4 x i32], align 16
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %i, metadata !20, metadata !DIExpression()), !dbg !22
  %call = call i8* @malloc(i64 noundef 16) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %i, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [4 x i32]* %ar, metadata !24, metadata !DIExpression()), !dbg !28
  %1 = bitcast [4 x i32]* %ar to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.main.ar to i8*), i64 16, i1 false), !dbg !28
  %call1 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !29
  call void @srand(i32 noundef %call1), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %a, metadata !31, metadata !DIExpression()), !dbg !32
  %call2 = call i32 @rand(), !dbg !33
  %rem = srem i32 %call2, 51, !dbg !34
  store i32 %rem, i32* %a, align 4, !dbg !32
  %2 = load i32, i32* %a, align 4, !dbg !35
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 3, !dbg !36
  store i32 %2, i32* %arrayidx, align 4, !dbg !37
  %3 = load i32*, i32** %i, align 8, !dbg !38
  %4 = bitcast i32* %3 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 0, !dbg !38
  %5 = bitcast i32* %arraydecay to i8*, !dbg !38
  %6 = load i32*, i32** %i, align 8, !dbg !38
  %7 = bitcast i32* %6 to i8*, !dbg !38
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !38
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 16, i64 noundef %8) #7, !dbg !38
  %9 = load i32*, i32** %i, align 8, !dbg !39
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 2, !dbg !39
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !39
  %cmp = icmp sgt i32 %10, 2, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 5, !dbg !43
  store i32 1, i32* %arrayidx5, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  %11 = load i32*, i32** %i, align 8, !dbg !47
  %arrayidx6 = getelementptr inbounds i32, i32* %11, i64 3, !dbg !47
  %12 = load i32, i32* %arrayidx6, align 4, !dbg !47
  %idxprom = sext i32 %12 to i64, !dbg !49
  %arrayidx7 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx7, align 4, !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %13, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare void @srand(i32 noundef) #4

declare i32 @time(...) #4

declare i32 @rand() #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 5)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 9, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !DILocation(line: 9, column: 10, scope: !9)
!23 = !DILocation(line: 9, column: 14, scope: !9)
!24 = !DILocalVariable(name: "ar", scope: !9, file: !10, line: 10, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 4)
!28 = !DILocation(line: 10, column: 9, scope: !9)
!29 = !DILocation(line: 11, column: 11, scope: !9)
!30 = !DILocation(line: 11, column: 5, scope: !9)
!31 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 12, type: !13)
!32 = !DILocation(line: 12, column: 6, scope: !9)
!33 = !DILocation(line: 12, column: 10, scope: !9)
!34 = !DILocation(line: 12, column: 17, scope: !9)
!35 = !DILocation(line: 14, column: 13, scope: !9)
!36 = !DILocation(line: 14, column: 5, scope: !9)
!37 = !DILocation(line: 14, column: 11, scope: !9)
!38 = !DILocation(line: 15, column: 5, scope: !9)
!39 = !DILocation(line: 16, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !9, file: !10, line: 16, column: 9)
!41 = !DILocation(line: 16, column: 14, scope: !40)
!42 = !DILocation(line: 16, column: 9, scope: !9)
!43 = !DILocation(line: 17, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 16, column: 19)
!45 = !DILocation(line: 17, column: 19, scope: !44)
!46 = !DILocation(line: 18, column: 5, scope: !44)
!47 = !DILocation(line: 21, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 19, column: 10)
!49 = !DILocation(line: 21, column: 9, scope: !48)
!50 = !DILocation(line: 21, column: 22, scope: !48)
!51 = !DILocation(line: 23, column: 1, scope: !9)
