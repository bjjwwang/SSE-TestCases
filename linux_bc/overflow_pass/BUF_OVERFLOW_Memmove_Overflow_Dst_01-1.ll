; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.source = private unnamed_addr constant [4 x i32] [i32 9, i32 9, i32 9, i32 9], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %dest = alloca i32*, align 8
  %source = alloca [4 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %dest, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = alloca i8, i64 12, align 16, !dbg !18
  %1 = bitcast i8* %0 to i32*, !dbg !19
  store i32* %1, i32** %dest, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata [4 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !24
  %2 = bitcast [4 x i32]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([4 x i32]* @__const.main.source to i8*), i64 16, i1 false), !dbg !24
  %3 = load i32*, i32** %dest, align 8, !dbg !25
  %4 = bitcast i32* %3 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %source, i64 0, i64 0, !dbg !26
  %5 = bitcast i32* %arraydecay to i8*, !dbg !26
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 16, i1 false), !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memmove_Overflow_Dst_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!5}
!16 = !DILocalVariable(name: "dest", scope: !12, file: !13, line: 8, type: !4)
!17 = !DILocation(line: 8, column: 7, scope: !12)
!18 = !DILocation(line: 8, column: 20, scope: !12)
!19 = !DILocation(line: 8, column: 14, scope: !12)
!20 = !DILocalVariable(name: "source", scope: !12, file: !13, line: 9, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 4)
!24 = !DILocation(line: 9, column: 9, scope: !12)
!25 = !DILocation(line: 10, column: 10, scope: !12)
!26 = !DILocation(line: 10, column: 2, scope: !12)
!27 = !DILocation(line: 11, column: 1, scope: !12)
