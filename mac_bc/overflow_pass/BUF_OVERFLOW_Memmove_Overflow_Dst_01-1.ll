; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.source = private unnamed_addr constant [4 x i32] [i32 9, i32 9, i32 9, i32 9], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %dest = alloca i32*, align 8
  %source = alloca [4 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %dest, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = alloca i8, i64 12, align 16, !dbg !19
  %1 = bitcast i8* %0 to i32*, !dbg !20
  store i32* %1, i32** %dest, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata [4 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !25
  %2 = bitcast [4 x i32]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([4 x i32]* @__const.main.source to i8*), i64 16, i1 false), !dbg !25
  %3 = load i32*, i32** %dest, align 8, !dbg !26
  %4 = bitcast i32* %3 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %source, i64 0, i64 0, !dbg !26
  %5 = bitcast i32* %arraydecay to i8*, !dbg !26
  %6 = load i32*, i32** %dest, align 8, !dbg !26
  %7 = bitcast i32* %6 to i8*, !dbg !26
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 16, i64 noundef %8) #4, !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!4}
!16 = !{}
!17 = !DILocalVariable(name: "dest", scope: !12, file: !13, line: 8, type: !3)
!18 = !DILocation(line: 8, column: 7, scope: !12)
!19 = !DILocation(line: 8, column: 20, scope: !12)
!20 = !DILocation(line: 8, column: 14, scope: !12)
!21 = !DILocalVariable(name: "source", scope: !12, file: !13, line: 9, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 4)
!25 = !DILocation(line: 9, column: 9, scope: !12)
!26 = !DILocation(line: 10, column: 2, scope: !12)
!27 = !DILocation(line: 11, column: 1, scope: !12)
