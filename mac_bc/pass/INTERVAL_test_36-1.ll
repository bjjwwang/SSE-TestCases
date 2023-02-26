; ModuleID = 'mac_bc/pass/INTERVAL_test_36-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_36-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.ar = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 5], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32*, align 8
  %ar = alloca [4 x i32], align 16
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32** %i, metadata !15, metadata !DIExpression()), !dbg !17
  %call = call i8* @malloc(i64 noundef 16) #6, !dbg !18
  %0 = bitcast i8* %call to i32*, !dbg !18
  store i32* %0, i32** %i, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata [4 x i32]* %ar, metadata !19, metadata !DIExpression()), !dbg !23
  %1 = bitcast [4 x i32]* %ar to i8*, !dbg !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.main.ar to i8*), i64 16, i1 false), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i32, i32* %a, align 4, !dbg !26
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 3, !dbg !27
  store i32 %2, i32* %arrayidx, align 4, !dbg !28
  %3 = load i32*, i32** %i, align 8, !dbg !29
  %4 = bitcast i32* %3 to i8*, !dbg !29
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 0, !dbg !29
  %5 = bitcast i32* %arraydecay to i8*, !dbg !29
  %6 = load i32*, i32** %i, align 8, !dbg !29
  %7 = bitcast i32* %6 to i8*, !dbg !29
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 16, i64 noundef %8) #7, !dbg !29
  %9 = load i32*, i32** %i, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 3, !dbg !30
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !30
  %cmp = icmp sgt i32 %10, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %11 = load i32*, i32** %i, align 8, !dbg !34
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 3, !dbg !34
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !34
  %cmp4 = icmp sgt i32 %12, 5, !dbg !36
  call void @svf_assert(i1 noundef zeroext %cmp4), !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  %13 = load i32*, i32** %i, align 8, !dbg !39
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 3, !dbg !39
  %14 = load i32, i32* %arrayidx5, align 4, !dbg !39
  %cmp6 = icmp sle i32 %14, 5, !dbg !41
  call void @svf_assert(i1 noundef zeroext %cmp6), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %15, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @svf_assert(i1 noundef zeroext) #5

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_36-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_36-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 9, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!17 = !DILocation(line: 9, column: 10, scope: !9)
!18 = !DILocation(line: 9, column: 14, scope: !9)
!19 = !DILocalVariable(name: "ar", scope: !9, file: !10, line: 10, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 4)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!25 = !DILocation(line: 11, column: 9, scope: !9)
!26 = !DILocation(line: 12, column: 13, scope: !9)
!27 = !DILocation(line: 12, column: 5, scope: !9)
!28 = !DILocation(line: 12, column: 11, scope: !9)
!29 = !DILocation(line: 13, column: 5, scope: !9)
!30 = !DILocation(line: 14, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 9)
!32 = !DILocation(line: 14, column: 14, scope: !31)
!33 = !DILocation(line: 14, column: 9, scope: !9)
!34 = !DILocation(line: 15, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 14, column: 19)
!36 = !DILocation(line: 15, column: 25, scope: !35)
!37 = !DILocation(line: 15, column: 9, scope: !35)
!38 = !DILocation(line: 16, column: 5, scope: !35)
!39 = !DILocation(line: 18, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !10, line: 17, column: 10)
!41 = !DILocation(line: 18, column: 25, scope: !40)
!42 = !DILocation(line: 18, column: 9, scope: !40)
!43 = !DILocation(line: 20, column: 1, scope: !9)
